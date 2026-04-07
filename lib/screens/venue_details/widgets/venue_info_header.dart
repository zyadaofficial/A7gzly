import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/court.dart';

class VenueInfoHeader extends StatelessWidget {
  final Court court;
  const VenueInfoHeader({super.key, required this.court});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            court.name,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 26,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.8,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.starGoldBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rounded,
                        color: AppColors.starGold, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      court.rating.toString(),
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '(${court.reviewCount} reviews)',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: court.type == 'padel'
                      ? AppColors.secondaryLight
                      : AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  court.type == 'padel'
                      ? '\u{1F3BE} Padel'
                      : '\u26BD Football',
                  style: TextStyle(
                    color: court.type == 'padel'
                        ? AppColors.secondary
                        : AppColors.primaryDark,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.location_on_rounded,
                  color: AppColors.coral, size: 16),
              const SizedBox(width: 4),
              Text(
                '${court.area}, Alexandria',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 6),
              Container(
                width: 4, height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textMuted, shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '${court.distance} away',
                style: TextStyle(
                  color: AppColors.textMuted, fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
