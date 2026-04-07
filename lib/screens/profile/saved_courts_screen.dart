import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../models/mock_data.dart';
import '../venue_details/venue_details_screen.dart';

class SavedCourtsScreen extends StatefulWidget {
  const SavedCourtsScreen({super.key});

  @override
  State<SavedCourtsScreen> createState() => _SavedCourtsScreenState();
}

class _SavedCourtsScreenState extends State<SavedCourtsScreen> {
  late List<bool> _saved;

  @override
  void initState() {
    super.initState();
    _saved = List.filled(MockData.topCourts.length, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('Saved Courts'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: MockData.topCourts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final court = MockData.topCourts[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => VenueDetailsScreen(court: court)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(16)),
                    child: SizedBox(
                      width: 100,
                      height: 90,
                      child: Image.network(
                        court.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: AppColors.surfaceLight,
                          child: Icon(Icons.sports_soccer,
                              color: AppColors.textMuted),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(court.name,
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: AppColors.textMuted, size: 13),
                              const SizedBox(width: 3),
                              Text('${court.area} \u2022 ${court.distance}',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 12,
                                  )),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.star_rounded,
                                  color: AppColors.starGold, size: 14),
                              const SizedBox(width: 3),
                              Text('${court.rating}',
                                  style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  )),
                              const Spacer(),
                              Text('${court.pricePerHour.toInt()} EGP/hr',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Remove button
                  GestureDetector(
                    onTap: () => setState(() => _saved[index] = !_saved[index]),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Icon(
                        _saved[index]
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: _saved[index]
                            ? AppColors.coral
                            : AppColors.textMuted,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
