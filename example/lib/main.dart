import 'package:example/gallery.dart';
import 'package:example/widgets/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // When embedded as a docs-site preview iframe, the parent page passes
    // its current color mode as `?theme=dark`/`light` (see
    // docs/.vitepress/theme/ComponentPreview.vue and HeroShowcase.vue) so
    // the preview doesn't stay stuck in light mode inside a dark-mode page.
    final isDark = Uri.base.queryParameters['theme'] == 'dark';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Beautify — Live Gallery',
      theme: isDark ? FBTheme.darkTheme() : FBTheme.lightTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const GalleryScreen(),
        for (final route in galleryPreviewRoutes.entries)
          route.key: route.value,
      },
    );
  }
}
