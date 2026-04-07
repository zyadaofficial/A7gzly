import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('About A7gezly'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),

          // Logo
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Center(
                child: Text('\u26BD', style: TextStyle(fontSize: 36)),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Center(
            child: Text('A7gezly',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1,
                )),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text('Version 1.0.0',
                style: TextStyle(
                  color: AppColors.textMuted, fontSize: 14,
                )),
          ),

          const SizedBox(height: 28),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              'A7gezly is the easiest way for youth in Egypt to discover and book football and padel courts. '
              'We connect players with the best local venues, offering real-time availability, flash deals, '
              'and instant booking \u2014 all in a few taps.\n\n'
              'Our mission is to make playing sports as easy as ordering food. '
              'No more calling courts, no more WhatsApp groups. Just open, book, and play.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.6,
              ),
            ),
          ),

          const SizedBox(height: 20),

          _LinkTile(icon: Icons.description_outlined, label: 'Terms of Service',
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Opening Terms of Service...'), backgroundColor: AppColors.secondary,
                  behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))))),
          _LinkTile(icon: Icons.privacy_tip_outlined, label: 'Privacy Policy',
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Opening Privacy Policy...'), backgroundColor: AppColors.secondary,
                  behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))))),
          _LinkTile(icon: Icons.cookie_outlined, label: 'Cookie Policy',
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Opening Cookie Policy...'), backgroundColor: AppColors.secondary,
                  behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))))),

          const SizedBox(height: 28),

          Center(
            child: Text('Made with \u2764\uFE0F in Alexandria, Egypt',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 13,
                )),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _LinkTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  const _LinkTile({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
            Icon(icon, color: AppColors.textMuted, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(label,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Icon(Icons.open_in_new_rounded,
                color: AppColors.textMuted, size: 16),
          ],
        ),
      ),
    );
  }
}
