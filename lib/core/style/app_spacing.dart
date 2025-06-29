import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  // Base spacing unit
  static const double _baseUnit = 4.0;
  
  // Spacing values
  static double get xs => _baseUnit.sp; // 4
  static double get sm => (_baseUnit * 2).sp; // 8
  static double get md => (_baseUnit * 3).sp; // 12
  static double get lg => (_baseUnit * 4).sp; // 16
  static double get xl => (_baseUnit * 5).sp; // 20
  static double get xxl => (_baseUnit * 6).sp; // 24
  static double get xxxl => (_baseUnit * 8).sp; // 32
  static double get xxxxl => (_baseUnit * 10).sp; // 40
  
  // Specific spacing values
  static double get spacing2 => 2.sp;
  static double get spacing4 => 4.sp;
  static double get spacing6 => 6.sp;
  static double get spacing8 => 8.sp;
  static double get spacing10 => 10.sp;
  static double get spacing12 => 12.sp;
  static double get spacing14 => 14.sp;
  static double get spacing16 => 16.sp;
  static double get spacing18 => 18.sp;
  static double get spacing20 => 20.sp;
  static double get spacing22 => 22.sp;
  static double get spacing24 => 24.sp;
  static double get spacing26 => 26.sp;
  static double get spacing28 => 28.sp;
  static double get spacing30 => 30.sp;
  static double get spacing32 => 32.sp;
  static double get spacing36 => 36.sp;
  static double get spacing40 => 40.sp;
  static double get spacing44 => 44.sp;
  static double get spacing48 => 48.sp;
  static double get spacing52 => 52.sp;
  static double get spacing56 => 56.sp;
  static double get spacing60 => 60.sp;
  static double get spacing64 => 64.sp;
  static double get spacing72 => 72.sp;
  static double get spacing80 => 80.sp;
  static double get spacing96 => 96.sp;
  static double get spacing120 => 120.sp;
  
  // Border radius values
  static double get radiusXs => 4.r;
  static double get radiusSm => 8.r;
  static double get radiusMd => 12.r;
  static double get radiusLg => 16.r;
  static double get radiusXl => 20.r;
  static double get radiusXxl => 24.r;
  static double get radiusXxxl => 32.r;
  static double get radiusFull => 999.r;
  
  // Icon sizes
  static double get iconXs => 12.sp;
  static double get iconSm => 16.sp;
  static double get iconMd => 20.sp;
  static double get iconLg => 24.sp;
  static double get iconXl => 32.sp;
  static double get iconXxl => 40.sp;
  static double get iconXxxl => 48.sp;
  
  // Button heights
  static double get buttonHeightSm => 32.h;
  static double get buttonHeightMd => 40.h;
  static double get buttonHeightLg => 48.h;
  static double get buttonHeightXl => 56.h;
  
  // Input heights
  static double get inputHeightSm => 32.h;
  static double get inputHeightMd => 40.h;
  static double get inputHeightLg => 48.h;
  static double get inputHeightXl => 56.h;
  
  // Card dimensions
  static double get cardPaddingSm => 12.w;
  static double get cardPaddingMd => 16.w;
  static double get cardPaddingLg => 20.w;
  static double get cardPaddingXl => 24.w;
  
  // Screen margins
  static double get screenMarginSm => 16.w;
  static double get screenMarginMd => 20.w;
  static double get screenMarginLg => 24.w;
  static double get screenMarginXl => 32.w;
  
  // App bar heights
  static double get appBarHeight => 56.h;
  static double get appBarHeightLarge => 64.h;
  
  // Bottom navigation height
  static double get bottomNavHeight => 56.h;
  
  // Floating action button size
  static double get fabSize => 56.w;
  static double get fabSizeLarge => 64.w;
  
  // Divider thickness
  static double get dividerThickness => 1.h;
  static double get dividerThicknessThick => 2.h;
  
  // Shadow offsets
  static double get shadowOffsetX => 0.w;
  static double get shadowOffsetY => 2.h;
  static double get shadowOffsetYLarge => 4.h;
  static double get shadowOffsetYXl => 8.h;
  
  // Shadow blur radius
  static double get shadowBlurSm => 4.r;
  static double get shadowBlurMd => 8.r;
  static double get shadowBlurLg => 12.r;
  static double get shadowBlurXl => 16.r;
  static double get shadowBlurXxl => 20.r;
  
  // Animation durations
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);
  static const Duration durationVerySlow = Duration(milliseconds: 800);
  
  // Animation curves
  static const Curve curveFast = Curves.easeInOut;
  static const Curve curveNormal = Curves.easeInOut;
  static const Curve curveSlow = Curves.easeInOut;
  static const Curve curveBounce = Curves.bounceOut;
  static const Curve curveElastic = Curves.elasticOut;
} 