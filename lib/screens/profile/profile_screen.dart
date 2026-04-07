import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../main.dart';
import '../auth/auth_screen.dart';
import 'edit_profile_screen.dart';
import 'saved_courts_screen.dart';
import 'notifications_screen.dart';
import 'payment_methods_screen.dart';
import 'help_screen.dart';
import 'about_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _language = 'English';
  String _city = 'Alexandria';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Profile header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
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
                // Avatar + edit
                Stack(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Center(
                        child: Text('AZ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            )),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.white, width: 2),
                        ),
                        child: const Icon(Icons.camera_alt_rounded,
                            color: Colors.white, size: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text('Ahmed Zyada',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    )),
                const SizedBox(height: 4),
                Text('ahmed.zyada@email.com',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    )),
                const SizedBox(height: 4),
                Text('+20 1234 567 890',
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 13,
                    )),
                const SizedBox(height: 16),
                // Edit profile button
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => const EditProfileScreen()),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Edit Profile',
                        style: TextStyle(
                          color: AppColors.primaryDark,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Referral banner
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.white,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                builder: (ctx) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.divider, borderRadius: BorderRadius.circular(2)))),
                      const SizedBox(height: 20),
                      Text('Invite Friends', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 8),
                      Text('Share your code — you both get 50 EGP!', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: AppColors.surfaceLight, borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('A7G-ZYADA25', style: TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: 2)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(ctx).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: const Text('Referral code copied!'), backgroundColor: AppColors.primary,
                                behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(gradient: AppColors.blueGradient, borderRadius: BorderRadius.circular(16)),
                          child: const Center(child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.copy_rounded, color: Colors.white, size: 18),
                              SizedBox(width: 8),
                              Text('Copy & Share', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                            ],
                          )),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: AppColors.blueGradient,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.card_giftcard_rounded,
                        color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Invite Friends, Earn 50 EGP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(height: 2),
                        Text('Share your referral code',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.white70, size: 16),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Section: Account
          _SectionTitle('Account'),
          const SizedBox(height: 10),
          _MenuItem(
            icon: Icons.person_outline_rounded,
            label: 'Edit Profile',
            subtitle: 'Name, email, phone',
            color: AppColors.primary,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => const EditProfileScreen()),
            ),
          ),
          _MenuItem(
            icon: Icons.favorite_border_rounded,
            label: 'Saved Courts',
            subtitle: '4 courts saved',
            color: AppColors.coral,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => const SavedCourtsScreen()),
            ),
          ),
          _MenuItem(
            icon: Icons.payment_rounded,
            label: 'Payment Methods',
            subtitle: 'Cards, wallets',
            color: AppColors.secondary,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => const PaymentMethodsScreen()),
            ),
          ),

          const SizedBox(height: 20),

          // Section: Preferences
          _SectionTitle('Preferences'),
          const SizedBox(height: 10),
          // Dark Mode Toggle
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
                    color: AppColors.textPrimary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Icon(
                    themeProvider.isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                    color: themeProvider.isDark ? AppColors.starGold : AppColors.orange,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Night Mode',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(height: 2),
                      Text(themeProvider.isDark ? 'On' : 'Off',
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          )),
                    ],
                  ),
                ),
                Switch(
                  value: themeProvider.isDark,
                  onChanged: (v) {
                    themeProvider.toggleTheme();
                    AppColors.setDark(v);
                    setState(() {});
                  },
                  activeTrackColor: AppColors.primary,
                  activeThumbColor: Colors.white,
                ),
              ],
            ),
          ),
          _MenuItem(
            icon: Icons.notifications_none_rounded,
            label: 'Notifications',
            subtitle: 'Deals, reminders',
            color: AppColors.orange,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => const NotificationsScreen()),
            ),
          ),
          _MenuItem(
            icon: Icons.language_rounded,
            label: 'Language',
            subtitle: _language,
            color: AppColors.secondary,
            onTap: () {
              final languages = ['English', 'Arabic'];
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.white,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                builder: (ctx) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.divider, borderRadius: BorderRadius.circular(2)))),
                      const SizedBox(height: 20),
                      Text('Select Language', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 16),
                      ...languages.map((lang) => ListTile(
                        leading: Icon(Icons.language_rounded, color: lang == _language ? AppColors.secondary : AppColors.textMuted),
                        title: Text(lang, style: TextStyle(color: AppColors.textPrimary, fontWeight: lang == _language ? FontWeight.w700 : FontWeight.w500)),
                        trailing: lang == _language ? const Icon(Icons.check_circle_rounded, color: AppColors.secondary) : null,
                        onTap: () { setState(() => _language = lang); Navigator.of(ctx).pop(); },
                      )),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            },
          ),
          _MenuItem(
            icon: Icons.location_on_outlined,
            label: 'Default City',
            subtitle: _city,
            color: AppColors.primary,
            onTap: () {
              final cities = ['Alexandria', 'Cairo', 'Giza', 'Mansoura', 'Tanta', 'Damanhur'];
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.white,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                builder: (ctx) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.divider, borderRadius: BorderRadius.circular(2)))),
                      const SizedBox(height: 20),
                      Text('Select City', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 16),
                      ...cities.map((city) => ListTile(
                        leading: Icon(Icons.location_on_rounded, color: city == _city ? AppColors.primary : AppColors.textMuted),
                        title: Text(city, style: TextStyle(color: AppColors.textPrimary, fontWeight: city == _city ? FontWeight.w700 : FontWeight.w500)),
                        trailing: city == _city ? const Icon(Icons.check_circle_rounded, color: AppColors.primary) : null,
                        onTap: () { setState(() => _city = city); Navigator.of(ctx).pop(); },
                      )),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          // Section: Support
          _SectionTitle('Support'),
          const SizedBox(height: 10),
          _MenuItem(
            icon: Icons.help_outline_rounded,
            label: 'Help & Support',
            subtitle: 'FAQs, contact us',
            color: AppColors.textSecondary,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const HelpScreen()),
            ),
          ),
          _MenuItem(
            icon: Icons.info_outline_rounded,
            label: 'About A7gezly',
            subtitle: 'Version 1.0.0',
            color: AppColors.textSecondary,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AboutScreen()),
            ),
          ),
          _MenuItem(
            icon: Icons.star_outline_rounded,
            label: 'Rate the App',
            subtitle: 'Love it? Let us know!',
            color: AppColors.starGold,
            onTap: () {
              int rating = 0;
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
                          Text('Enjoying A7gezly?', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w800)),
                          const SizedBox(height: 8),
                          Text('Tap a star to rate us on the store', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (i) => GestureDetector(
                              onTap: () => setDialogState(() => rating = i + 1),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Icon(i < rating ? Icons.star_rounded : Icons.star_outline_rounded, color: AppColors.starGold, size: 36),
                              ),
                            )),
                          ),
                          const SizedBox(height: 24),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(ctx).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: const Text('Thanks for your feedback!'), backgroundColor: AppColors.primary,
                                    behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(gradient: AppColors.primaryGradient, borderRadius: BorderRadius.circular(12)),
                              child: const Center(child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          // Sign out
          GestureDetector(
            onTap: () => _showSignOutDialog(context),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.coralLight,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout_rounded,
                      color: AppColors.coral, size: 20),
                  const SizedBox(width: 8),
                  const Text('Sign Out',
                      style: TextStyle(
                        color: AppColors.coral,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
          Center(
            child: Text('Version 1.0.0',
                style: TextStyle(
                  color: AppColors.textMuted, fontSize: 12,
                )),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: AppColors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.coralLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.logout_rounded,
                    color: AppColors.coral, size: 28),
              ),
              const SizedBox(height: 16),
              Text('Sign Out?',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  )),
              const SizedBox(height: 8),
              Text('Are you sure you want to sign out?',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  )),
              const SizedBox(height: 24),
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
                          child: Text('Cancel',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(ctx).pop();
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (_) => const AuthScreen()),
                          (_) => false,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: AppColors.coral,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text('Sign Out',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              )),
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
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
          color: AppColors.textMuted,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ));
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
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
                  Text(label,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                      )),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded,
                color: AppColors.textMuted, size: 15),
          ],
        ),
      ),
    );
  }
}
