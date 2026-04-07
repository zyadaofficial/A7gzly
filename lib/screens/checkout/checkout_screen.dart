import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../models/booking.dart';
import 'widgets/booking_summary_card.dart';
import 'widgets/price_breakdown.dart';
import 'widgets/payment_method_selector.dart';
import 'widgets/cancellation_policy.dart';
import 'widgets/swipe_to_pay_button.dart';

class CheckoutScreen extends StatefulWidget {
  final BookingSummary booking;
  const CheckoutScreen({super.key, required this.booking});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  PaymentMethodType _selectedPayment = PaymentMethodType.instapay;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.arrow_back_rounded,
                color: AppColors.textPrimary, size: 20),
          ),
        ),
        title: const Text('Checkout'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.shield_outlined,
                color: AppColors.primary.withValues(alpha: 0.6), size: 22),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 12),
              children: [
                // Secure badge
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.lock_rounded,
                            color: AppColors.primary, size: 12),
                        const SizedBox(width: 5),
                        Text('Secured by 256-bit encryption',
                            style: TextStyle(
                              color: AppColors.primaryDark,
                              fontSize: 11, fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                ),
                BookingSummaryCard(booking: widget.booking),
                const SizedBox(height: 20),
                PriceBreakdown(booking: widget.booking),
                const SizedBox(height: 24),
                PaymentMethodSelector(
                  selectedMethod: _selectedPayment,
                  onMethodSelected: (m) =>
                      setState(() => _selectedPayment = m),
                ),
                const SizedBox(height: 20),
                const CancellationPolicy(),
                const SizedBox(height: 24),
              ],
            ),
          ),
          // Bottom bar
          Container(
            padding:
                EdgeInsets.fromLTRB(20, 16, 20, bottomPadding + 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                  top: BorderSide(color: AppColors.divider)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 16, offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('You\'ll pay',
                          style: TextStyle(
                            color: AppColors.textSecondary, fontSize: 13,
                          )),
                      Row(
                        children: [
                          Text('${widget.booking.totalPrice.toInt()} EGP',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 20, fontWeight: FontWeight.w800,
                              )),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryLight,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              widget.booking.timeSlot.split(' - ').first,
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontSize: 11, fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SwipeToPayButton(
                  totalPrice: widget.booking.totalPrice,
                  onConfirmed: _handlePayment,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handlePayment() {
    Future.delayed(const Duration(milliseconds: 800), () {
      if (!mounted) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => _SuccessDialog(
          booking: widget.booking,
          onDone: () {
            Navigator.of(context)
              ..pop()
              ..pop()
              ..pop();
          },
        ),
      );
    });
  }
}

class _SuccessDialog extends StatelessWidget {
  final BookingSummary booking;
  final VoidCallback onDone;
  const _SuccessDialog({required this.booking, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72, height: 72,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle_rounded,
                  color: AppColors.primary, size: 44),
            ),
            const SizedBox(height: 20),
            Text('Booking Confirmed!',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 22, fontWeight: FontWeight.w800,
                )),
            const SizedBox(height: 8),
            Text(
              'Your slot at ${booking.court.name} has been reserved.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textSecondary, fontSize: 14, height: 1.4,
              ),
            ),
            const SizedBox(height: 8),
            Text(booking.timeSlot,
                style: TextStyle(
                  color: AppColors.secondary,
                  fontSize: 16, fontWeight: FontWeight.w700,
                )),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: onDone,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Text('Back to Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16, fontWeight: FontWeight.w700,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
