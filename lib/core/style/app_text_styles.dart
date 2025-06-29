import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Font Families
  static String get _arabicFont => GoogleFonts.cairo().fontFamily ?? 'Cairo';
  static String get _englishFont => GoogleFonts.poppins().fontFamily ?? 'Poppins';
  
  // Base Text Style Generator
  static TextStyle _getBaseStyle(
    BuildContext context,
    double size, {
    FontWeight? weight,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final fontFamily = isArabic ? _arabicFont : _englishFont;
    
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size.sp,
      fontWeight: weight ?? FontWeight.normal,
      color: color,
      height: height,
      decoration: decoration,
    );
  }
  
  // Display Styles
  static TextStyle displayLarge(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        32,
        weight: FontWeight.bold,
        color: color ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary),
        height: 1.2,
      );
  
  static TextStyle displayMedium(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        28,
        weight: FontWeight.bold,
        color: color ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary),
        height: 1.3,
      );
  
  static TextStyle displaySmall(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        24,
        weight: FontWeight.w600,
        color: color ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary),
        height: 1.4,
      );
  
  // Headline Styles
  static TextStyle headlineLarge(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        22,
        weight: FontWeight.w600,
        color: color ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary),
        height: 1.4,
      );
  
  static TextStyle headlineMedium(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        20,
        weight: FontWeight.w600,
        color: color ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary),
        height: 1.4,
      );
  
  static TextStyle headlineSmall(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        18,
        weight: FontWeight.w600,
        color: color ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary),
        height: 1.4,
      );
  
  // Title Styles
  static TextStyle titleLarge(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        16,
        weight: FontWeight.w600,
        color: color ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary),
        height: 1.5,
      );
  
  static TextStyle titleMedium(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        14,
        weight: FontWeight.w600,
        color: color ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary),
        height: 1.5,
      );
  
  static TextStyle titleSmall(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        12,
        weight: FontWeight.w600,
        color: color ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary),
        height: 1.5,
      );
  
  // Body Styles
  static TextStyle bodyLarge(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        16,
        weight: FontWeight.normal,
        color: color ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary),
        height: 1.5,
      );
  
  static TextStyle bodyMedium(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        14,
        weight: FontWeight.normal,
        color: color ?? (isDark ? AppColors.textSecondaryDark : AppColors.textSecondary),
        height: 1.5,
      );
  
  static TextStyle bodySmall(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        12,
        weight: FontWeight.normal,
        color: color ?? (isDark ? AppColors.textSecondaryDark : AppColors.textTertiary),
        height: 1.5,
      );
  
  // Label Styles
  static TextStyle labelLarge(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        14,
        weight: FontWeight.w500,
        color: color ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary),
        height: 1.4,
      );
  
  static TextStyle labelMedium(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        12,
        weight: FontWeight.w500,
        color: color ?? (isDark ? AppColors.textSecondaryDark : AppColors.textSecondary),
        height: 1.4,
      );
  
  static TextStyle labelSmall(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        10,
        weight: FontWeight.w500,
        color: color ?? (isDark ? AppColors.textSecondaryDark : AppColors.textTertiary),
        height: 1.4,
      );
  
  // Button Styles
  static TextStyle buttonLarge(BuildContext context, {Color? color}) =>
      _getBaseStyle(
        context,
        16,
        weight: FontWeight.w600,
        color: color ?? AppColors.textPrimaryDark,
        height: 1.4,
      );
  
  static TextStyle buttonMedium(BuildContext context, {Color? color}) =>
      _getBaseStyle(
        context,
        14,
        weight: FontWeight.w600,
        color: color ?? AppColors.textPrimaryDark,
        height: 1.4,
      );
  
  static TextStyle buttonSmall(BuildContext context, {Color? color}) =>
      _getBaseStyle(
        context,
        12,
        weight: FontWeight.w600,
        color: color ?? AppColors.textPrimaryDark,
        height: 1.4,
      );
  
  // Input Styles
  static TextStyle inputText(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        16,
        weight: FontWeight.normal,
        color: color ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary),
        height: 1.5,
      );
  
  static TextStyle inputLabel(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        14,
        weight: FontWeight.w600,
        color: color ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary),
        height: 1.4,
      );
  
  static TextStyle inputHint(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        16,
        weight: FontWeight.normal,
        color: color ?? (isDark ? AppColors.textSecondaryDark : AppColors.textTertiary),
        height: 1.5,
      );
  
  // Link Styles
  static TextStyle link(BuildContext context, {Color? color}) =>
      _getBaseStyle(
        context,
        14,
        weight: FontWeight.w600,
        color: color ?? AppColors.primary,
        decoration: TextDecoration.underline,
        height: 1.4,
      );
  
  // Caption Styles
  static TextStyle caption(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        12,
        weight: FontWeight.normal,
        color: color ?? (isDark ? AppColors.textSecondaryDark : AppColors.textTertiary),
        height: 1.4,
      );
  
  // Overline Styles
  static TextStyle overline(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        10,
        weight: FontWeight.w500,
        color: color ?? (isDark ? AppColors.textSecondaryDark : AppColors.textTertiary),
        height: 1.4,
      );
  
  // Medical Specific Styles
  static TextStyle medicalTitle(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        20,
        weight: FontWeight.bold,
        color: color ?? AppColors.primary,
        height: 1.3,
      );
  
  static TextStyle medicalSubtitle(BuildContext context, {Color? color, bool isDark = false}) =>
      _getBaseStyle(
        context,
        16,
        weight: FontWeight.w500,
        color: color ?? (isDark ? AppColors.textSecondaryDark : AppColors.textSecondary),
        height: 1.4,
      );
  
  // Error Styles
  static TextStyle errorText(BuildContext context) =>
      _getBaseStyle(
        context,
        12,
        weight: FontWeight.normal,
        color: AppColors.error,
        height: 1.4,
      );
  
  // Success Styles
  static TextStyle successText(BuildContext context) =>
      _getBaseStyle(
        context,
        12,
        weight: FontWeight.normal,
        color: AppColors.success,
        height: 1.4,
      );
} 