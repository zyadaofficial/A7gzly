import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class StickyBottomBar extends StatelessWidget {
  final double totalPrice;
  final String? selectedTime;
  final int hours;
  final VoidCallback onProceed;

  const StickyBottomBar({
    super.key,
    required this.totalPrice,
    required this.selectedTime,
    this.hours = 0,
    required this.onProceed,
  });

  @override
  Widget build(BuildContext context) {
    final hasSelection = selectedTime != null;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(20, 16, 20, bottomPadding + 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.divider)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: hasSelection
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total',
                          style: TextStyle(
                            color: AppColors.textMuted, fontSize: 12,
                          )),
                      Row(
                        children: [
                          Text(
                            '${totalPrice.toInt()} EGP',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryLight,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              hours > 1 ? '$hours hrs' : selectedTime!,
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (hours > 1)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            selectedTime!,
                            style: TextStyle(
                              color: AppColors.textMuted,
                              fontSize: 11,
                            ),
                          ),
                        ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Select a time slot',
                          style: TextStyle(
                            color: AppColors.textSecondary, fontSize: 15,
                            fontWeight: FontWeight.w500,
                          )),
                      Text('to see the total price',
                          style: TextStyle(
                            color: AppColors.textMuted, fontSize: 12,
                          )),
                    ],
                  ),
          ),
          GestureDetector(
            onTap: hasSelection ? onProceed : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding:
                  const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              decoration: BoxDecoration(
                gradient:
                    hasSelection ? AppColors.primaryGradient : null,
                color: hasSelection ? null : AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(16),
                boxShadow: hasSelection
                    ? [
                        BoxShadow(
                          color:
                              AppColors.primary.withValues(alpha: 0.35),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                'Proceed to Pay',
                style: TextStyle(
                  color: hasSelection
                      ? Colors.white
                      : AppColors.textMuted,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
