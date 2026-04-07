import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('Help & Support'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Contact options
          Row(
            children: [
              _ContactCard(
                icon: Icons.chat_bubble_outline_rounded,
                label: 'Live Chat',
                color: AppColors.primary,
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Starting live chat...'), backgroundColor: AppColors.primary,
                      behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(width: 12),
              _ContactCard(
                icon: Icons.email_outlined,
                label: 'Email Us',
                color: AppColors.secondary,
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Opening email to support@a7gezly.com'), backgroundColor: AppColors.secondary,
                      behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(width: 12),
              _ContactCard(
                icon: Icons.phone_outlined,
                label: 'Call Us',
                color: AppColors.orange,
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Calling +20 3 123 4567...'), backgroundColor: AppColors.orange,
                      behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          Text('Frequently Asked Questions',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              )),
          const SizedBox(height: 14),

          _FaqTile(
            question: 'How do I book a court?',
            answer:
                'Browse courts on the Explore tab, select a venue, pick your date and time, then proceed to checkout. You can pay with card, mobile wallet, or InstaPay.',
          ),
          _FaqTile(
            question: 'Can I cancel my booking?',
            answer:
                'Yes! Free cancellation is available up to 12 hours before your match. After that, a 50% cancellation fee applies.',
          ),
          _FaqTile(
            question: 'How does the wallet work?',
            answer:
                'Top up your A7gezly Wallet using Vodafone Cash, Fawry, or bank transfer. Use your balance for faster checkout and earn cashback on bookings.',
          ),
          _FaqTile(
            question: 'What if the court is in bad condition?',
            answer:
                'Contact us through Live Chat within 2 hours of your booking. We\'ll investigate and process a refund if the court doesn\'t meet our quality standards.',
          ),
          _FaqTile(
            question: 'How do referral rewards work?',
            answer:
                'Share your referral code with friends. When they complete their first booking, you both get 50 EGP in wallet credits!',
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;
  const _ContactCard(
      {required this.icon, required this.label, required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(height: 8),
              Text(label,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _FaqTile extends StatefulWidget {
  final String question;
  final String answer;
  const _FaqTile({required this.question, required this.answer});

  @override
  State<_FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<_FaqTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(widget.question,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(Icons.expand_more_rounded,
                        color: AppColors.textMuted, size: 22),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(widget.answer,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    height: 1.5,
                  )),
            ),
            crossFadeState: _expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
