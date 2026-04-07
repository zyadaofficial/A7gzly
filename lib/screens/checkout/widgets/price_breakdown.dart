import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/booking.dart';

class PriceBreakdown extends StatelessWidget {
  final BookingSummary booking;
  const PriceBreakdown({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: AppColors.shadow, blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price Details',
              style: TextStyle(
                color: AppColors.textPrimary, fontSize: 16,
                fontWeight: FontWeight.w700,
              )),
          const SizedBox(height: 16),
          _PriceRow('Court Fee (${booking.hours} hr${booking.hours > 1 ? 's' : ''})', '${booking.courtFee.toInt()} EGP'),
          const SizedBox(height: 10),
          _PriceRow('Service Fee', '${booking.serviceFee.toInt()} EGP',
              sub: 'Platform & support'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Divider(color: AppColors.divider, height: 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',
                  style: TextStyle(
                    color: AppColors.textPrimary, fontSize: 18,
                    fontWeight: FontWeight.w800,
                  )),
              Text('${booking.totalPrice.toInt()} EGP',
                  style: const TextStyle(
                    color: AppColors.primary, fontSize: 22,
                    fontWeight: FontWeight.w800,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String amount;
  final String? sub;
  const _PriceRow(this.label, this.amount, {this.sub});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: TextStyle(
                    color: AppColors.textSecondary, fontSize: 14,
                  )),
              if (sub != null)
                Text(sub!,
                    style: TextStyle(
                      color: AppColors.textMuted, fontSize: 11,
                    )),
            ],
          ),
        ),
        Text(amount,
            style: TextStyle(
              color: AppColors.textPrimary, fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}
