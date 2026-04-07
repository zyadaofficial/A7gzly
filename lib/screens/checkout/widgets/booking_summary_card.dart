import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/booking.dart';

class BookingSummaryCard extends StatelessWidget {
  final BookingSummary booking;
  const BookingSummaryCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: AppColors.shadow, blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 80, height: 80,
              child: Image.network(
                booking.court.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, __, ___) => Container(
                  color: AppColors.surfaceLight,
                  child: Icon(Icons.sports_soccer, color: AppColors.textMuted),
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(booking.court.name,
                    style: TextStyle(
                      color: AppColors.textPrimary, fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 6),
                _Row(Icons.calendar_today_rounded, _formatDate(booking.date)),
                const SizedBox(height: 4),
                _Row(Icons.access_time_rounded,
                    booking.hours > 1
                        ? '${booking.timeSlot} (${booking.hours} hrs)'
                        : booking.timeSlot,
                    color: AppColors.secondary),
                const SizedBox(height: 4),
                _Row(Icons.location_on_outlined,
                    '${booking.court.area}, Alexandria'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime d) {
    const w = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
    const m = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    return '${w[d.weekday - 1]}, ${m[d.month - 1]} ${d.day}';
  }
}

class _Row extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  _Row(this.icon, this.text, {Color? color}) : color = color ?? AppColors.textSecondary;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.textMuted, size: 14),
        const SizedBox(width: 6),
        Expanded(
          child: Text(text,
              style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w500),
              maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
