import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Medical Theme
  static const Color primary = Color(0xFF2E7D8A);
  static const Color primaryLight = Color(0xFF4A9BA8);
  static const Color primaryDark = Color(0xFF1E5A6A);

  // Secondary Colors
  static const Color secondary = Color(0xFFF8F9FA);
  static const Color secondaryLight = Color(0xFFFFFFFF);
  static const Color secondaryDark = Color(0xFFE9ECEF);

  // Surface Colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E2E);
  static const Color surfaceSecondary = Color(0xFF2C3E50);

  // Text Colors
  static const Color textPrimary = Color(0xFF2C3E50);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textTertiary = Color(0xFFADB5BD);
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFE9ECEF);

  // Error Colors
  static const Color error = Color(0xFFE53935);
  static const Color errorLight = Color(0xFFFF6B6B);
  static const Color errorDark = Color(0xFFC62828);

  // Success Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF66BB6A);
  static const Color successDark = Color(0xFF388E3C);

  // Warning Colors
  static const Color warning = Color(0xFFFF9800);
  static const Color warningLight = Color(0xFFFFB74D);
  static const Color warningDark = Color(0xFFF57C00);

  // Info Colors
  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFF64B5F6);
  static const Color infoDark = Color(0xFF1976D2);

  // Border Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFF3A3A3A);
  static const Color borderLight = Color(0xFFF1F3F4);

  // Shadow Colors
  static const Color shadow = Color(0x1A000000);
  static const Color shadowDark = Color(0x40000000);
  static const Color shadowLight = Color(0x0A000000);

  // Background Colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color backgroundDark = Color(0xFF0F0F23);
  static const Color backgroundLight = Color(0xFFFFFFFF);

  // Overlay Colors
  static const Color overlay = Color(0x80000000);
  static const Color overlayLight = Color(0x40000000);

  // Medical Specific Colors
  static const Color medicalBlue = Color(0xFF1976D2);
  static const Color medicalGreen = Color(0xFF4CAF50);
  static const Color medicalRed = Color(0xFFE53935);
  static const Color medicalOrange = Color(0xFFFF9800);
  static const Color medicalPurple = Color(0xFF9C27B0);

  // Social Media Colors
  static const Color facebook = Color(0xFF1877F2);
  static const Color google = Color(0xFFDB4437);
  static const Color apple = Color(0xFF000000);
  static const Color twitter = Color(0xFF1DA1F2);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF2E7D8A),
    Color(0xFF4A9BA8),
  ];

  static const List<Color> secondaryGradient = [
    Color(0xFFF8F9FA),
    Color(0xFFE9ECEF),
  ];

  static const List<Color> successGradient = [
    Color(0xFF4CAF50),
    Color(0xFF66BB6A),
  ];

  static const List<Color> errorGradient = [
    Color(0xFFE53935),
    Color(0xFFFF6B6B),
  ];

  // Dark Mode Specific Gradients
  static const List<Color> darkBackgroundGradient = [
    Color(0xFF0F0F23),
    Color(0xFF1A1A2E),
  ];

  static const List<Color> darkSurfaceGradient = [
    Color(0xFF1E1E2E),
    Color(0xFF2A2A3A),
  ];

  // Opacity Helpers
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  // Theme-aware color getters
  static Color getSurfaceColor(bool isDark) {
    return isDark ? surfaceDark : surface;
  }

  static Color getTextColor(bool isDark) {
    return isDark ? textPrimaryDark : textPrimary;
  }

  static Color getBorderColor(bool isDark) {
    return isDark ? borderDark : border;
  }

  static Color getShadowColor(bool isDark) {
    return isDark ? shadowDark : shadow;
  }

  // Dark mode specific color getters
  static Color getDarkBackgroundColor() {
    return backgroundDark;
  }

  static Color getDarkSurfaceColor() {
    return surfaceDark;
  }

  static Color getDarkBorderColor() {
    return borderDark;
  }
}
