import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ─── Mutable color set that swaps between light & dark ───
class AppColors {
  static bool _isDark = false;
  static bool get isDark => _isDark;

  static void setDark(bool dark) => _isDark = dark;

  // Base
  static Color get background => _isDark ? const Color(0xFF292E35) : const Color(0xFFF7F7F9);
  static Color get white => _isDark ? const Color(0xFF343A42) : const Color(0xFFFFFFFF);
  static Color get surface => _isDark ? const Color(0xFF343A42) : const Color(0xFFFFFFFF);
  static Color get surfaceLight => _isDark ? const Color(0xFF3D444D) : const Color(0xFFF0F1F5);
  static Color get cardBg => _isDark ? const Color(0xFF343A42) : const Color(0xFFFFFFFF);

  // Primary — vibrant energetic green (action/CTA)
  static const Color primary = Color(0xFF00C853);
  static const Color primaryDark = Color(0xFF009624);
  static Color get primaryLight => _isDark ? const Color(0xFF1B3D2A) : const Color(0xFFE8F5E9);

  // Secondary — electric blue (info/highlights)
  static const Color secondary = Color(0xFF2979FF);
  static Color get secondaryLight => _isDark ? const Color(0xFF1B2E45) : const Color(0xFFE3F2FD);

  // Accent — hot coral/orange for urgency & energy
  static const Color coral = Color(0xFFFF5252);
  static Color get coralLight => _isDark ? const Color(0xFF3D2020) : const Color(0xFFFFF0F0);
  static const Color orange = Color(0xFFFF6D00);
  static Color get orangeLight => _isDark ? const Color(0xFF3D2E1A) : const Color(0xFFFFF3E0);

  // Text
  static Color get textPrimary => _isDark ? const Color(0xFFF0F0F2) : const Color(0xFF1A1D26);
  static Color get textSecondary => _isDark ? const Color(0xFFB0B5BE) : const Color(0xFF6B7280);
  static Color get textMuted => _isDark ? const Color(0xFF7A8290) : const Color(0xFFA0A6B1);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Utility
  static Color get divider => _isDark ? const Color(0xFF444B55) : const Color(0xFFE8E8ED);
  static const Color starGold = Color(0xFFFFC107);
  static Color get starGoldBg => _isDark ? const Color(0xFF3D3518) : const Color(0xFFFFF8E1);
  static const Color success = Color(0xFF00C853);
  static const Color error = Color(0xFFFF5252);
  static Color get shadow => _isDark ? const Color(0x28000000) : const Color(0x14000000);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF00C853), Color(0xFF00E676)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient coralGradient = LinearGradient(
    colors: [Color(0xFFFF5252), Color(0xFFFF7043)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blueGradient = LinearGradient(
    colors: [Color(0xFF2979FF), Color(0xFF448AFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF7F7F9),
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: Color(0xFFFFFFFF),
        error: AppColors.error,
      ),
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        scrolledUnderElevation: 0.5,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xFFFFFFFF),
        ),
        titleTextStyle: TextStyle(
          color: Color(0xFF1A1D26),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: IconThemeData(color: Color(0xFF1A1D26)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFFFFFFF),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Color(0xFFA0A6B1),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF292E35),
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: Color(0xFF343A42),
        error: AppColors.error,
      ),
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF343A42),
        elevation: 0,
        scrolledUnderElevation: 0.5,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Color(0xFF343A42),
        ),
        titleTextStyle: TextStyle(
          color: Color(0xFFF0F0F2),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: IconThemeData(color: Color(0xFFF0F0F2)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF343A42),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Color(0xFF7A8290),
      ),
    );
  }
}
