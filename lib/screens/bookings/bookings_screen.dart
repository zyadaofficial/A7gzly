import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('My Bookings'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textMuted,
          indicatorColor: AppColors.primary,
          indicatorWeight: 3,
          labelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          unselectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Past'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _UpcomingTab(),
          _PastTab(),
        ],
      ),
    );
  }
}

class _UpcomingTab extends StatelessWidget {
  final _upcomingBookings = const [
    _BookingData(
      court: 'The Arena Sports Hub',
      type: 'football',
      date: 'Saturday, April 5',
      time: '8:00 PM',
      price: 250,
      status: 'confirmed',
      image:
          'https://images.unsplash.com/photo-1529900748604-07564a03e7a6?w=400&q=80',
    ),
    _BookingData(
      court: 'Padel Zone Alexandria',
      type: 'padel',
      date: 'Monday, April 7',
      time: '6:00 PM',
      price: 300,
      status: 'confirmed',
      image:
          'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=400&q=80',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: _upcomingBookings.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (context, index) =>
          _BookingCard(booking: _upcomingBookings[index], isUpcoming: true),
    );
  }
}

class _PastTab extends StatelessWidget {
  final _pastBookings = const [
    _BookingData(
      court: 'Goal Centre',
      type: 'football',
      date: 'Wednesday, March 26',
      time: '9:00 PM',
      price: 200,
      status: 'completed',
      image:
          'https://images.unsplash.com/photo-1575361204480-aadce3e14ed6?w=400&q=80',
    ),
    _BookingData(
      court: 'Smash Padel Club',
      type: 'padel',
      date: 'Friday, March 21',
      time: '7:30 PM',
      price: 350,
      status: 'completed',
      image:
          'https://images.unsplash.com/photo-1526232761682-d26e03ac148e?w=400&q=80',
    ),
    _BookingData(
      court: 'The Arena Sports Hub',
      type: 'football',
      date: 'Sunday, March 16',
      time: '5:00 PM',
      price: 250,
      status: 'cancelled',
      image:
          'https://images.unsplash.com/photo-1529900748604-07564a03e7a6?w=400&q=80',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: _pastBookings.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (context, index) =>
          _BookingCard(booking: _pastBookings[index], isUpcoming: false),
    );
  }
}

class _BookingCard extends StatefulWidget {
  final _BookingData booking;
  final bool isUpcoming;
  const _BookingCard({required this.booking, required this.isUpcoming});

  @override
  State<_BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<_BookingCard> {
  _BookingData get booking => widget.booking;
  bool get isUpcoming => widget.isUpcoming;

  void _showCancelDialog() {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56, height: 56,
                decoration: BoxDecoration(
                  color: AppColors.coralLight, shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close_rounded, color: AppColors.coral, size: 28),
              ),
              const SizedBox(height: 16),
              Text('Cancel Booking?',
                  style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text('Are you sure you want to cancel your booking at ${booking.court}?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.orangeLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline_rounded, color: AppColors.orange, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text('Free cancellation up to 12h before. After that, 50% fee applies.',
                          style: TextStyle(color: AppColors.orange, fontSize: 12, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.of(ctx).pop(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceLight,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text('Keep It', style: TextStyle(color: AppColors.textSecondary, fontSize: 15, fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(ctx).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Booking cancelled successfully'),
                            backgroundColor: AppColors.primary,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: AppColors.coral,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text('Cancel Booking', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRateDialog() {
    int selectedRating = 0;
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => Dialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Rate Your Experience',
                    style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                Text(booking.court,
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (i) => GestureDetector(
                    onTap: () => setDialogState(() => selectedRating = i + 1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        i < selectedRating ? Icons.star_rounded : Icons.star_outline_rounded,
                        color: AppColors.starGold,
                        size: 36,
                      ),
                    ),
                  )),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    Navigator.of(ctx).pop();
                    if (selectedRating > 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Thanks! You rated $selectedRating stars'),
                          backgroundColor: AppColors.primary,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDirections() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening directions to ${booking.court}...'),
        backgroundColor: AppColors.secondary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top: image + info
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Image.network(
                      booking.image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: AppColors.surfaceLight,
                        child: Icon(Icons.sports_soccer,
                            color: AppColors.textMuted),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              booking.court,
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          _StatusBadge(status: booking.status),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.calendar_today_rounded,
                              color: AppColors.textMuted, size: 13),
                          const SizedBox(width: 4),
                          Text(booking.date,
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 12,
                              )),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Icon(Icons.access_time_rounded,
                              color: AppColors.textMuted, size: 13),
                          const SizedBox(width: 4),
                          Text(booking.time,
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              )),
                          const Spacer(),
                          Text('${booking.price} EGP',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bottom action
          if (isUpcoming) ...[
            Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: AppColors.divider)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton.icon(
                      onPressed: _showCancelDialog,
                      icon: Icon(Icons.close_rounded,
                          color: AppColors.coral, size: 18),
                      label: Text('Cancel',
                          style: TextStyle(
                            color: AppColors.coral,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ),
                  Container(width: 1, height: 30, color: AppColors.divider),
                  Expanded(
                    child: TextButton.icon(
                      onPressed: _showDirections,
                      icon: Icon(Icons.map_outlined,
                          color: AppColors.secondary, size: 18),
                      label: Text('Directions',
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (!isUpcoming && booking.status == 'completed') ...[
            Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: AppColors.divider)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton.icon(
                      onPressed: _showRateDialog,
                      icon: Icon(Icons.star_outline_rounded,
                          color: AppColors.starGold, size: 18),
                      label: Text('Rate',
                          style: TextStyle(
                            color: AppColors.starGold,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ),
                  Container(width: 1, height: 30, color: AppColors.divider),
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Searching for available slots at ${booking.court}...'),
                            backgroundColor: AppColors.primary,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        );
                      },
                      icon: Icon(Icons.replay_rounded,
                          color: AppColors.primary, size: 18),
                      label: Text('Book Again',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg, fg;
    String label;
    switch (status) {
      case 'confirmed':
        bg = AppColors.primaryLight;
        fg = AppColors.primaryDark;
        label = 'Confirmed';
      case 'completed':
        bg = AppColors.secondaryLight;
        fg = AppColors.secondary;
        label = 'Completed';
      case 'cancelled':
        bg = AppColors.coralLight;
        fg = AppColors.coral;
        label = 'Cancelled';
      default:
        bg = AppColors.surfaceLight;
        fg = AppColors.textMuted;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label,
          style: TextStyle(
            color: fg,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          )),
    );
  }
}

class _BookingData {
  final String court;
  final String type;
  final String date;
  final String time;
  final int price;
  final String status;
  final String image;

  const _BookingData({
    required this.court,
    required this.type,
    required this.date,
    required this.time,
    required this.price,
    required this.status,
    required this.image,
  });
}
