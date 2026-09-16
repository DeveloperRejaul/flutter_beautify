import 'package:flutter/material.dart';

import 'demo/accordion_example.dart';
import 'demo/appbar_example.dart';
import 'demo/avatar_example.dart';
import 'demo/badge_example.dart';
import 'demo/bottom_navigation_bar_example.dart';
import 'demo/bottom_sheet_example.dart';
import 'demo/breadcrumb_example.dart';
import 'demo/button_example.dart';
import 'demo/calendar_example.dart';
import 'demo/card_example.dart';
import 'demo/checkbox_example.dart';
import 'demo/date_picker_example.dart';
import 'demo/dialog_example.dart';
import 'demo/dropdown_example.dart';
import 'demo/pagination_example.dart';
import 'demo/progress_example.dart';
import 'demo/radio_button_example.dart';
import 'demo/responsive_example.dart';
import 'demo/sidebar_example.dart';
import 'demo/slider_example.dart';
import 'demo/snackbar_example.dart';
import 'demo/switch_example.dart';
import 'demo/tabs_example.dart';
import 'demo/textfield_example.dart';
import 'demo/theme_example.dart';
import 'demo/toast_example.dart';
import 'demo/tooltip_example.dart';

/// One entry in the gallery: what `flutter_beautify add <addCommand>` gives
/// you, and the demo screen that shows it running.
class GalleryEntry {
  const GalleryEntry(
    this.title,
    this.addCommand,
    this.builder, {
    this.selfScaffolded = true,
  });

  final String title;
  final String addCommand;
  final WidgetBuilder builder;

  /// Most demo screens already wrap themselves in a Scaffold + AppBar.
  /// A handful just return their content, expecting a host Scaffold — for
  /// those we supply one when navigating.
  final bool selfScaffolded;

  /// The full demo screen, wrapping bare content in a Scaffold when needed.
  /// Used by the gallery list, where a title bar (and its back button) make
  /// sense as part of in-app navigation.
  Widget buildScreen(BuildContext context) {
    if (selfScaffolded) return builder(context);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: builder(context),
        ),
      ),
    );
  }

  /// A chrome-free rendering for the docs site's embedded preview: no title
  /// bar, since the doc page already has its own heading. Self-scaffolded
  /// demo screens bake their own `AppBar(title: Text('FBX Example'))` into
  /// their build method — rather than editing every demo file, this
  /// collapses that inherited AppBar to zero height via a scoped
  /// AppBarTheme. (It doesn't affect a demo whose subject *is* an AppBar,
  /// like FBAppBar's own preview: that's a bespoke widget that ignores
  /// AppBarTheme entirely.)
  Widget buildPreview(BuildContext context) {
    if (selfScaffolded) {
      return Theme(
        data: Theme.of(context).copyWith(
          appBarTheme: Theme.of(
            context,
          ).appBarTheme.copyWith(toolbarHeight: 0, elevation: 0),
        ),
        child: builder(context),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: builder(context),
          ),
        ),
      ),
    );
  }
}

class GalleryCategory {
  const GalleryCategory(this.title, this.entries);

  final String title;
  final List<GalleryEntry> entries;
}

final galleryCategories = <GalleryCategory>[
  GalleryCategory('Theming & layout', [
    GalleryEntry('Theme', 'theme', (_) => const ThemeExample()),
    GalleryEntry('Responsive', 'responsive', (_) => const ResponsiveExample()),
  ]),
  GalleryCategory('Form controls', [
    GalleryEntry(
      'Button',
      'button',
      (_) => const ButtonExample(),
      selfScaffolded: false,
    ),
    GalleryEntry(
      'Checkbox',
      'checkbox',
      (_) => const CheckboxExample(),
      selfScaffolded: false,
    ),
    GalleryEntry(
      'TextField',
      'textfield',
      (_) => const TextfieldExample(),
      selfScaffolded: false,
    ),
    GalleryEntry(
      'RadioButton',
      'radio-button',
      (_) => const RadioButtonExample(),
    ),
    GalleryEntry('Slider', 'slider', (_) => const SliderExample()),
    GalleryEntry('Switch', 'switch', (_) => const SwitchExample()),
    GalleryEntry('Dropdown', 'dropdown', (_) => const DropdownExample()),
  ]),
  GalleryCategory('Layout', [
    GalleryEntry(
      'Card',
      'card',
      (_) => const CardExample(),
      selfScaffolded: false,
    ),
    GalleryEntry('Accordion', 'accordion', (_) => const AccordionExample()),
    GalleryEntry(
      'BottomSheet',
      'bottom-sheet',
      (_) => const BottomSheetExample(),
    ),
    GalleryEntry('Sidebar', 'sidebar', (_) => const SidebarExample()),
    GalleryEntry('Breadcrumb', 'breadcrumb', (_) => const BreadcrumbExample()),
  ]),
  GalleryCategory('Navigation', [
    GalleryEntry('AppBar', 'appbar', (_) => const AppbarExample()),
    GalleryEntry('Tabs', 'tabs', (_) => const TabsExample()),
    GalleryEntry('Pagination', 'pagination', (_) => const PaginationExample()),
    GalleryEntry(
      'BottomNavigationBar',
      'bottom-navigation-bar',
      (_) => const BottomNavigationBarExample(),
    ),
    GalleryEntry('Avatar', 'avatar', (_) => const AvatarExample()),
  ]),
  GalleryCategory('Progress & loading', [
    GalleryEntry(
      'LinearProgress',
      'linear-progress',
      (_) => const ProgressExample(),
    ),
    GalleryEntry(
      'CircularProgress',
      'circular-progress',
      (_) => const ProgressExample(),
    ),
  ]),
  GalleryCategory('Feedback & overlays', [
    GalleryEntry(
      'Dialog',
      'dialog',
      (_) => const DialogExample(),
      selfScaffolded: false,
    ),
    GalleryEntry(
      'Snackbar',
      'snackbar',
      (_) => const SnackbarExample(),
      selfScaffolded: false,
    ),
    GalleryEntry(
      'Toast',
      'toast',
      (_) => const ToastExample(),
      selfScaffolded: false,
    ),
    GalleryEntry('Badge', 'badge', (_) => const BadgeExample()),
    GalleryEntry('Tooltip', 'tooltip', (_) => const TooltipExample()),
  ]),
  GalleryCategory('Date & time', [
    GalleryEntry('DatePicker', 'date-picker', (_) => const DatePickerExample()),
    GalleryEntry('Calendar', 'calendar', (_) => const CalendarExample()),
  ]),
];

/// One deep-linkable route per component, keyed by its `add` command
/// (`/button`, `/date-picker`, …). The docs site embeds these directly in an
/// iframe as each component page's "Preview" tab — see
/// docs/.vitepress/theme/ComponentPreview.vue.
final Map<String, WidgetBuilder> galleryPreviewRoutes = {
  for (final category in galleryCategories)
    for (final entry in category.entries)
      '/${entry.addCommand}': entry.buildPreview,
};

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  void _open(BuildContext context, GalleryEntry entry) {
    Navigator.of(context).push(MaterialPageRoute(builder: entry.buildScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Beautify — Live Gallery')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          for (final category in galleryCategories) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            for (final entry in category.entries)
              ListTile(
                title: Text(entry.title),
                subtitle: Text('flutter_beautify add ${entry.addCommand}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _open(context, entry),
              ),
          ],
        ],
      ),
    );
  }
}
