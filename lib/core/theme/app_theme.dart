import 'package:flutter/material.dart';

class ThemeHelper {
  final BuildContext context;
  late final ThemeData theme;
  late final ColorScheme colors;

  ThemeHelper(this.context) {
    theme = Theme.of(context);
    colors = theme.colorScheme;
  }
}

class AppTheme {
  // Light ColorScheme
  static ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff0057a8), // Teal
    secondary: Color(0xFFF2F2F2), // Light Cyan
    surface: Color(0xFFFFFFFF), // White
    error: Color(0xFFD32F2F), // Red
    onPrimary: Colors.white, // Text color on primary
    onSecondary: Colors.black, // Text color on secondary
    onSurface: Colors.black,
    onError: Colors.white,
    shadow: Color(0x29000000), // Shadow color
  );

  // Dark ColorScheme
  static ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff0057a8), // Darker Teal
    secondary: Color(0xFFF2F2F2), // Bright Cyan
    surface: Color(0xFF212121), // Dark surface color
    error: Color(0xFFD32F2F), // Red
    onPrimary: Colors.white, // Text color on primary
    onSecondary: Colors.black, // Text color on secondary
    onSurface: Colors.white, // White text on dark surface
    onError: Colors.white,
    shadow: Color(0xFF000000), // Shadow color
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Light Theme Data
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: lightColorScheme,
      scaffoldBackgroundColor: lightColorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.primary,
        iconTheme: IconThemeData(color: lightColorScheme.primary),
        elevation: 4,
      ),
      iconTheme: IconThemeData(color: lightColorScheme.primary), // Icon color
      buttonTheme: ButtonThemeData(
        buttonColor: lightColorScheme.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 14, color: Colors.black),
        bodyMedium: TextStyle(fontSize: 12, color: Colors.black54),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: buttonText,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          return states.contains(WidgetState.selected)
              ? lightColorScheme.primary
              : Colors.grey.shade300;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
      ),
      dividerColor: Colors.grey.shade300,
      cardColor: Colors.white,
      tabBarTheme: TabBarThemeData(
        labelColor: lightColorScheme.onPrimary, // White text on primary
        unselectedLabelColor: Colors.grey.shade500,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
          letterSpacing: 0.5,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: 0.3,
        ),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: lightColorScheme.primary.withOpacity(0.95),
          boxShadow: [
            BoxShadow(
              color: lightColorScheme.primary.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return lightColorScheme.primary.withOpacity(0.1);
            }
            return null;
          },
        ),
        splashFactory: NoSplash.splashFactory,
      ),
    );
  }

  // Dark Theme Data
  static ThemeData get darkTheme {
    return ThemeData(
      tabBarTheme: TabBarThemeData(
        labelColor: darkColorScheme.onPrimary,
        unselectedLabelColor: Colors.grey.shade400,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
          letterSpacing: 0.5,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: 0.3,
        ),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: darkColorScheme.primary.withOpacity(0.95),
          boxShadow: [
            BoxShadow(
              color: darkColorScheme.primary.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return darkColorScheme.primary.withOpacity(0.15);
            }
            return null;
          },
        ),
        splashFactory: NoSplash.splashFactory,
      ),

      colorScheme: darkColorScheme,
      scaffoldBackgroundColor: darkColorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: darkColorScheme.primary,
        iconTheme: IconThemeData(color: darkColorScheme.primary),
        elevation: 4,
      ),
      iconTheme: IconThemeData(color: darkColorScheme.primary), // Icon color
      buttonTheme: ButtonThemeData(
        buttonColor: darkColorScheme.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        bodyLarge: TextStyle(fontSize: 14, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 12, color: Colors.white70),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkColorScheme.primary,
          textStyle: buttonText,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          return states.contains(WidgetState.selected)
              ? darkColorScheme.primary
              : Colors.grey.shade700;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
      ),
      dividerColor: Colors.grey.shade600,
      cardColor: const Color(0xFF424242),
    );
  }
}
