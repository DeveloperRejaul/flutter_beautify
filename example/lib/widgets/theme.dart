import 'package:flutter/material.dart';

/// Design tokens and ready-to-use ThemeData for this project.
///
/// Plug straight into MaterialApp:
///
/// MaterialApp(
///   theme: FBTheme.lightTheme(),
///   darkTheme: FBTheme.darkTheme(),
///   themeMode: ThemeMode.system,
/// )
///
/// Override the defaults per call instead of editing [FBColors] — useful
/// for white-labeling or a runtime brand-color picker:
///
/// FBTheme.lightTheme(primaryColor: Colors.deepPurple)
///
/// Pass `fontFamily` to use a custom font — add it under pubspec.yaml's
/// `fonts:` section first, then e.g. `FBTheme.lightTheme(fontFamily: 'Inter')`.
/// Leave it null to use the platform default.
class FBTheme {
  static ThemeData lightTheme({
    Color primaryColor = FBColors.primary,
    Color accentColor = FBColors.accent,
    Color errorColor = FBColors.error,
    String? fontFamily,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: fontFamily,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        secondary: accentColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: FBColors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: FBColors.white,
        elevation: 0,
        centerTitle: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(borderRadius: FBBorderRadius.sm),
        enabledBorder: OutlineInputBorder(
          borderRadius: FBBorderRadius.sm,
          borderSide: const BorderSide(color: FBColors.greyLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: FBBorderRadius.sm,
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        filled: true,
        fillColor: FBColors.surface,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: FBColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: FBBorderRadius.sm),
        ),
      ),
      textTheme: FBTypography.textTheme(
        color: FBColors.textPrimaryLight,
        fontFamily: fontFamily,
      ),
    );
  }

  static ThemeData darkTheme({
    Color primaryColor = FBColors.primary,
    Color accentColor = FBColors.accent,
    Color errorColor = FBColors.error,
    String? fontFamily,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: fontFamily,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
        secondary: accentColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: FBColors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: FBColors.greyDark,
        foregroundColor: FBColors.white,
        elevation: 0,
        centerTitle: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(borderRadius: FBBorderRadius.sm),
        enabledBorder: OutlineInputBorder(
          borderRadius: FBBorderRadius.sm,
          borderSide: const BorderSide(color: FBColors.greyDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: FBBorderRadius.sm,
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        filled: true,
        fillColor: FBColors.greyDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: FBColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: FBBorderRadius.sm),
        ),
      ),
      textTheme: FBTypography.textTheme(
        color: FBColors.white,
        fontFamily: fontFamily,
      ),
    );
  }
}

/// Color tokens. Edit these to match your brand — everything in
/// [FBTheme] is built from these, so a change here applies everywhere.
class FBColors {
  // Primary
  static const Color primary = Color(0xFF2196F3);
  static const Color primaryLight = Color(0xFFBBDEFB);
  static const Color primaryDark = Color(0xFF1976D2);

  // Accent
  static const Color accent = Color(0xFFFF4081);
  static const Color accentLight = Color(0xFFFF80AB);
  static const Color accentDark = Color(0xFFC51162);

  // Semantic
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Neutral
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyLight = Color(0xFFE0E0E0);
  static const Color greyDark = Color(0xFF424242);

  // Text
  static const Color textPrimaryLight = Color(0xFF1A1A1A);
  static const Color textSecondaryLight = Color(0xFF6B6B6B);

  // Background / surface
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Color(0xFFFFFFFF);
}

/// Spacing scale — use instead of magic numbers in `EdgeInsets`, `SizedBox`, etc.
class FBSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

/// Corner radius scale.
class FBBorderRadius {
  static const BorderRadius xs = BorderRadius.all(Radius.circular(4));
  static const BorderRadius sm = BorderRadius.all(Radius.circular(8));
  static const BorderRadius md = BorderRadius.all(Radius.circular(12));
  static const BorderRadius lg = BorderRadius.all(Radius.circular(16));
  static const BorderRadius full = BorderRadius.all(Radius.circular(100));
}

/// Type scale. [FBTheme.lightTheme]/[FBTheme.darkTheme] apply this
/// automatically — call [textTheme] directly only if you're assembling a
/// `ThemeData` by hand.
class FBTypography {
  static TextTheme textTheme({required Color color, String? fontFamily}) {
    TextStyle style(double size, FontWeight weight) => TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: weight,
      color: color,
    );

    return TextTheme(
      displayLarge: style(32, FontWeight.bold),
      displayMedium: style(28, FontWeight.bold),
      displaySmall: style(24, FontWeight.bold),
      headlineMedium: style(20, FontWeight.bold),
      headlineSmall: style(18, FontWeight.bold),
      titleLarge: style(16, FontWeight.bold),
      bodyLarge: style(16, FontWeight.normal),
      bodyMedium: style(14, FontWeight.normal),
      bodySmall: style(12, FontWeight.normal),
      labelLarge: style(14, FontWeight.bold),
    );
  }
}
