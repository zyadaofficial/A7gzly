import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _deals = true;
  bool _reminders = true;
  bool _bookingUpdates = true;
  bool _promotions = false;
  bool _newCourts = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('Notifications'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _ToggleTile(
            icon: Icons.local_offer_outlined,
            color: AppColors.coral,
            title: 'Flash Deals',
            subtitle: 'Get notified about discounted slots',
            value: _deals,
            onChanged: (v) => setState(() => _deals = v),
          ),
          _ToggleTile(
            icon: Icons.alarm_rounded,
            color: AppColors.orange,
            title: 'Match Reminders',
            subtitle: '1 hour before your booking',
            value: _reminders,
            onChanged: (v) => setState(() => _reminders = v),
          ),
          _ToggleTile(
            icon: Icons.update_rounded,
            color: AppColors.secondary,
            title: 'Booking Updates',
            subtitle: 'Confirmations, cancellations',
            value: _bookingUpdates,
            onChanged: (v) => setState(() => _bookingUpdates = v),
          ),
          _ToggleTile(
            icon: Icons.campaign_outlined,
            color: AppColors.primary,
            title: 'Promotions',
            subtitle: 'Special offers and rewards',
            value: _promotions,
            onChanged: (v) => setState(() => _promotions = v),
          ),
          _ToggleTile(
            icon: Icons.explore_outlined,
            color: AppColors.starGold,
            title: 'New Courts Nearby',
            subtitle: 'When new venues open in your area',
            value: _newCourts,
            onChanged: (v) => setState(() => _newCourts = v),
          ),
        ],
      ),
    );
  }
}

class _ToggleTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(height: 2),
                Text(subtitle,
                    style: TextStyle(
                      color: AppColors.textMuted, fontSize: 12,
                    )),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: AppColors.primary,
            activeThumbColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
