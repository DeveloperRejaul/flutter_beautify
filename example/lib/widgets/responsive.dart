import 'package:flutter/material.dart';

/// Screen-width breakpoints. Edit these to match your app's design.
class FBBreakpoints {
  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
}

enum FBScreenType { mobile, tablet, desktop }

/// `context.isMobile`, `context.screenType`, etc. — reads the current
/// screen width against [FBBreakpoints].
extension FBResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  FBScreenType get screenType {
    final width = screenWidth;
    if (width < FBBreakpoints.mobile) return FBScreenType.mobile;
    if (width < FBBreakpoints.tablet) return FBScreenType.tablet;
    return FBScreenType.desktop;
  }

  bool get isMobile => screenType == FBScreenType.mobile;
  bool get isTablet => screenType == FBScreenType.tablet;
  bool get isDesktop => screenType == FBScreenType.desktop;
}

/// Picks a value based on the current breakpoint.
///
/// FBResponsiveValue(mobile: 1, tablet: 2, desktop: 4).resolve(context)
///
/// An omitted `tablet`/`desktop` falls back to the next-smaller value you
/// did provide, so `FBResponsiveValue(mobile: 16, desktop: 32)` uses `16`
/// on tablet too.
class FBResponsiveValue<T> {
  const FBResponsiveValue({required this.mobile, this.tablet, this.desktop});

  final T mobile;
  final T? tablet;
  final T? desktop;

  T resolve(BuildContext context) {
    switch (context.screenType) {
      case FBScreenType.desktop:
        return desktop ?? tablet ?? mobile;
      case FBScreenType.tablet:
        return tablet ?? mobile;
      case FBScreenType.mobile:
        return mobile;
    }
  }
}

/// Builds a different widget per breakpoint, with the same fallback rule as
/// [FBResponsiveValue].
///
/// FBResponsive(
///   mobile: (context) => const _MobileNav(),
///   desktop: (context) => const _SidebarNav(),
/// )
class FBResponsive extends StatelessWidget {
  const FBResponsive({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;

  @override
  Widget build(BuildContext context) {
    switch (context.screenType) {
      case FBScreenType.desktop:
        return (desktop ?? tablet ?? mobile)(context);
      case FBScreenType.tablet:
        return (tablet ?? mobile)(context);
      case FBScreenType.mobile:
        return mobile(context);
    }
  }
}
