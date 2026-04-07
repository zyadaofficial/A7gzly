import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/search_filter_bar.dart';
import 'widgets/flash_slots_section.dart';
import 'widgets/top_courts_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: HomeAppBar(),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 16),
                child: SearchFilterBar(),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 24),
                child: FlashSlotsSection(),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 24, bottom: 20),
                child: TopCourtsSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
