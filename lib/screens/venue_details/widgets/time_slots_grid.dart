import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/time_slot.dart';

class TimeSlotsGrid extends StatelessWidget {
  final List<TimeSlot> slots;
  final Set<String> selectedTimes;
  final ValueChanged<String> onTimeSelected;

  const TimeSlotsGrid({
    super.key,
    required this.slots,
    required this.selectedTimes,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Available Slots',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  )),
              const Spacer(),
              _Legend(color: AppColors.primary, label: 'Selected'),
              const SizedBox(width: 12),
              _Legend(color: AppColors.divider, label: 'Booked'),
            ],
          ),
          const SizedBox(height: 16),
          Text('Tap multiple consecutive slots (max 5 hrs)',
              style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 11,
              )),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: slots.map((slot) {
              final isBooked = slot.status == SlotStatus.booked;
              final isSelected = selectedTimes.contains(slot.time);

              return GestureDetector(
                onTap: isBooked ? null : () => onTimeSelected(slot.time),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: (MediaQuery.of(context).size.width - 70) / 3,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    gradient: isSelected ? AppColors.primaryGradient : null,
                    color: isBooked
                        ? AppColors.surfaceLight
                        : isSelected
                            ? null
                            : AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: isSelected
                        ? null
                        : Border.all(
                            color: isBooked
                                ? AppColors.divider
                                : AppColors.divider,
                          ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color:
                                  AppColors.primary.withValues(alpha: 0.25),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      slot.time,
                      style: TextStyle(
                        color: isBooked
                            ? AppColors.textMuted
                            : isSelected
                                ? Colors.white
                                : AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        decoration:
                            isBooked ? TextDecoration.lineThrough : null,
                        decorationColor: AppColors.textMuted,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;
  const _Legend({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8, height: 8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 4),
        Text(label,
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}
