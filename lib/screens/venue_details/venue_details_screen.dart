import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../models/booking.dart';
import '../../models/court.dart';
import '../../models/time_slot.dart';
import '../checkout/checkout_screen.dart';
import 'widgets/hero_image_section.dart';
import 'widgets/venue_info_header.dart';
import 'widgets/urgency_banner.dart';
import 'widgets/amenities_row.dart';
import 'widgets/date_picker_strip.dart';
import 'widgets/time_slots_grid.dart';
import 'widgets/sticky_bottom_bar.dart';

class VenueDetailsScreen extends StatefulWidget {
  final Court court;
  const VenueDetailsScreen({super.key, required this.court});

  @override
  State<VenueDetailsScreen> createState() => _VenueDetailsScreenState();
}

class _VenueDetailsScreenState extends State<VenueDetailsScreen> {
  late DateTime _selectedDate;
  Set<String> _selectedTimes = {};
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _isFavorite = widget.court.isFavorite;
  }

  double get _totalPrice =>
      _selectedTimes.isEmpty ? 0 : widget.court.pricePerHour * _selectedTimes.length;

  int _slotIndex(String time) =>
      VenueMockData.timeSlots.indexWhere((s) => s.time == time);

  bool _areConsecutive(Set<String> times) {
    if (times.length <= 1) return true;
    final indices = times.map(_slotIndex).toList()..sort();
    for (int i = 1; i < indices.length; i++) {
      if (indices[i] != indices[i - 1] + 1) return false;
    }
    return true;
  }

  void _onTimeSelected(String time) {
    setState(() {
      if (_selectedTimes.contains(time)) {
        // Deselect — only allow if remaining selection stays consecutive
        final test = Set<String>.from(_selectedTimes)..remove(time);
        if (_areConsecutive(test)) {
          _selectedTimes = test;
        } else {
          // Can't deselect a middle slot — clear all
          _selectedTimes = {};
        }
      } else {
        if (_selectedTimes.length >= 5) return; // Max 5 hours
        final test = Set<String>.from(_selectedTimes)..add(time);
        if (_areConsecutive(test)) {
          _selectedTimes = test;
        } else {
          // Not consecutive — start fresh with this slot
          _selectedTimes = {time};
        }
      }
    });
  }

  String get _timeRangeLabel {
    if (_selectedTimes.isEmpty) return '';
    final sorted = _selectedTimes.toList()
      ..sort((a, b) => _slotIndex(a).compareTo(_slotIndex(b)));
    if (sorted.length == 1) return sorted.first;
    return '${sorted.first} – ${sorted.last}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeroImageSection(
                    imageUrl: widget.court.imageUrl,
                    isFavorite: _isFavorite,
                    onBackPressed: () => Navigator.of(context).pop(),
                    onFavoritePressed: () =>
                        setState(() => _isFavorite = !_isFavorite),
                  ),
                  VenueInfoHeader(court: widget.court),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: AppColors.divider, height: 1),
                  ),
                  const SizedBox(height: 20),
                  const UrgencyBanner(viewerCount: 4),
                  const SizedBox(height: 24),
                  const AmenitiesRow(),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: AppColors.divider, height: 1),
                  ),
                  const SizedBox(height: 24),
                  DatePickerStrip(
                    selectedDate: _selectedDate,
                    onDateSelected: (date) {
                      setState(() {
                        _selectedDate = date;
                        _selectedTimes = {};
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  TimeSlotsGrid(
                    slots: VenueMockData.timeSlots,
                    selectedTimes: _selectedTimes,
                    onTimeSelected: _onTimeSelected,
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
          StickyBottomBar(
            totalPrice: _totalPrice,
            selectedTime: _selectedTimes.isEmpty ? null : _timeRangeLabel,
            hours: _selectedTimes.length,
            onProceed: () {
              if (_selectedTimes.isEmpty) return;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CheckoutScreen(
                    booking: BookingSummary(
                      court: widget.court,
                      date: _selectedDate,
                      timeSlot: _timeRangeLabel,
                      hours: _selectedTimes.length,
                      courtFee: widget.court.pricePerHour * _selectedTimes.length,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
