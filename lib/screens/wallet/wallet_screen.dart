import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  static void _showTopUpSheet(BuildContext context, [String? prefilledAmount]) {
    final controller = TextEditingController(text: prefilledAmount ?? '');
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(ctx).viewInsets.bottom + 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.divider, borderRadius: BorderRadius.circular(2))),
            ),
            const SizedBox(height: 20),
            Text('Top Up Wallet', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                style: TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  hintText: '0',
                  hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 24),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: Text('EGP', style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.w700)),
                  ),
                  prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Top up via', style: TextStyle(color: AppColors.textSecondary, fontSize: 13, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            _TopUpOption(icon: Icons.phone_android_rounded, label: 'Vodafone Cash', color: AppColors.coral),
            _TopUpOption(icon: Icons.credit_card_rounded, label: 'Credit / Debit Card', color: AppColors.secondary),
            _TopUpOption(icon: Icons.account_balance_rounded, label: 'Bank Transfer', color: AppColors.primary),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(ctx).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Top up of ${controller.text.isEmpty ? '0' : controller.text} EGP initiated'),
                    backgroundColor: AppColors.primary,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(child: Text('Confirm Top Up', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _showSendSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(ctx).viewInsets.bottom + 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.divider, borderRadius: BorderRadius.circular(2))),
            ),
            const SizedBox(height: 20),
            Text('Send to Friend', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(color: AppColors.surfaceLight, borderRadius: BorderRadius.circular(14)),
              child: TextField(
                keyboardType: TextInputType.phone,
                style: TextStyle(color: AppColors.textPrimary, fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Phone number',
                  hintStyle: TextStyle(color: AppColors.textMuted),
                  prefixIcon: Icon(Icons.phone_outlined, color: AppColors.textMuted, size: 20),
                  prefixText: '+20 ',
                  prefixStyle: TextStyle(color: AppColors.textPrimary, fontSize: 15),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(color: AppColors.surfaceLight, borderRadius: BorderRadius.circular(14)),
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  hintText: '0',
                  hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 24),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: Text('EGP', style: TextStyle(color: AppColors.secondary, fontSize: 16, fontWeight: FontWeight.w700)),
                  ),
                  prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.of(ctx).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Transfer sent successfully!'),
                    backgroundColor: AppColors.primary,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(gradient: AppColors.blueGradient, borderRadius: BorderRadius.circular(16)),
                child: const Center(child: Text('Send Money', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _showQRSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.divider, borderRadius: BorderRadius.circular(2))),
            ),
            const SizedBox(height: 20),
            Text('QR Pay', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text('Show this code at the court to pay', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
            const SizedBox(height: 24),
            Container(
              width: 200, height: 200,
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.divider),
              ),
              child: Center(
                child: Icon(Icons.qr_code_2_rounded, size: 140, color: AppColors.textPrimary),
              ),
            ),
            const SizedBox(height: 16),
            Text('Ahmed Zyada', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w700)),
            Text('A7gezly Wallet', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('Wallet'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Balance Card
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.account_balance_wallet_rounded,
                        color: Colors.white, size: 24),
                    const SizedBox(width: 8),
                    const Text('A7gezly Wallet',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, fontWeight: FontWeight.w600,
                        )),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text('EGP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12, fontWeight: FontWeight.w700,
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Available Balance',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    )),
                const SizedBox(height: 4),
                const Text('1,250 EGP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36, fontWeight: FontWeight.w800,
                      letterSpacing: -1,
                    )),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _WalletAction(
                        icon: Icons.add_rounded, label: 'Top Up',
                        onTap: () => _showTopUpSheet(context)),
                    const SizedBox(width: 12),
                    _WalletAction(
                        icon: Icons.send_rounded, label: 'Send',
                        onTap: () => _showSendSheet(context)),
                    const SizedBox(width: 12),
                    _WalletAction(
                        icon: Icons.qr_code_rounded, label: 'QR Pay',
                        onTap: () => _showQRSheet(context)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Quick top-up
          Text('Quick Top Up',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 17, fontWeight: FontWeight.w700,
              )),
          const SizedBox(height: 14),
          Row(
            children: [
              _TopUpChip('50', onTap: () => _showTopUpSheet(context, '50')),
              const SizedBox(width: 10),
              _TopUpChip('100', onTap: () => _showTopUpSheet(context, '100')),
              const SizedBox(width: 10),
              _TopUpChip('200', onTap: () => _showTopUpSheet(context, '200')),
              const SizedBox(width: 10),
              _TopUpChip('500', onTap: () => _showTopUpSheet(context, '500')),
            ],
          ),

          const SizedBox(height: 28),

          // Transactions
          Row(
            children: [
              Text('Recent Transactions',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 17, fontWeight: FontWeight.w700,
                  )),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text('See All',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w600, fontSize: 13,
                    )),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _TransactionTile(
            icon: Icons.sports_soccer,
            iconBg: AppColors.primaryLight,
            iconColor: AppColors.primary,
            title: 'The Arena Sports Hub',
            subtitle: 'Court Booking',
            amount: '-250 EGP',
            amountColor: AppColors.coral,
            date: 'Today, 2:30 PM',
          ),
          _TransactionTile(
            icon: Icons.add_circle_outline,
            iconBg: AppColors.secondaryLight,
            iconColor: AppColors.secondary,
            title: 'Wallet Top Up',
            subtitle: 'Vodafone Cash',
            amount: '+500 EGP',
            amountColor: AppColors.primary,
            date: 'Yesterday, 11:00 AM',
          ),
          _TransactionTile(
            icon: Icons.sports_tennis,
            iconBg: AppColors.orangeLight,
            iconColor: AppColors.orange,
            title: 'Padel Zone Alexandria',
            subtitle: 'Court Booking',
            amount: '-300 EGP',
            amountColor: AppColors.coral,
            date: 'Mar 30, 6:15 PM',
          ),
          _TransactionTile(
            icon: Icons.card_giftcard_rounded,
            iconBg: AppColors.coralLight,
            iconColor: AppColors.coral,
            title: 'Referral Bonus',
            subtitle: 'Friend joined A7gezly',
            amount: '+50 EGP',
            amountColor: AppColors.primary,
            date: 'Mar 28, 9:00 AM',
          ),
        ],
      ),
    );
  }
}

class _WalletAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  const _WalletAction({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(height: 4),
            Text(label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11, fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
      ),
    );
  }
}

class _TopUpOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _TopUpOption({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 12),
          Text(label, style: TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
          const Spacer(),
          Icon(Icons.arrow_forward_ios_rounded, color: AppColors.textMuted, size: 14),
        ],
      ),
    );
  }
}

class _TopUpChip extends StatelessWidget {
  final String amount;
  final VoidCallback? onTap;
  const _TopUpChip(this.amount, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.divider),
          ),
          child: Center(
            child: Text('$amount\nEGP',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13, fontWeight: FontWeight.w700,
                  height: 1.3,
                )),
          ),
        ),
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
  final String date;

  const _TransactionTile({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14, fontWeight: FontWeight.w600,
                    )),
                const SizedBox(height: 2),
                Text(subtitle,
                    style: TextStyle(
                      color: AppColors.textMuted, fontSize: 12,
                    )),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount,
                  style: TextStyle(
                    color: amountColor,
                    fontSize: 14, fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 2),
              Text(date,
                  style: TextStyle(
                    color: AppColors.textMuted, fontSize: 11,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
