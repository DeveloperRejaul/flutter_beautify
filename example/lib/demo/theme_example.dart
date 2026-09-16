import 'package:flutter/material.dart';
import '../widgets/theme.dart';

class ThemeExample extends StatelessWidget {
  const ThemeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FBTheme Example')),
      body: ListView(
        padding: const EdgeInsets.all(FBSpacing.md),
        children: [
          const _SectionTitle('Colors'),
          Wrap(
            spacing: FBSpacing.sm,
            runSpacing: FBSpacing.sm,
            children: const [
              _Swatch('primary', FBColors.primary),
              _Swatch('accent', FBColors.accent),
              _Swatch('success', FBColors.success),
              _Swatch('warning', FBColors.warning),
              _Swatch('error', FBColors.error),
              _Swatch('info', FBColors.info),
            ],
          ),
          const SizedBox(height: FBSpacing.lg),
          const _SectionTitle('Spacing'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _SpacingBar('xs', FBSpacing.xs),
              _SpacingBar('sm', FBSpacing.sm),
              _SpacingBar('md', FBSpacing.md),
              _SpacingBar('lg', FBSpacing.lg),
              _SpacingBar('xl', FBSpacing.xl),
            ],
          ),
          const SizedBox(height: FBSpacing.lg),
          const _SectionTitle('Border radius'),
          Wrap(
            spacing: FBSpacing.sm,
            children: const [
              _RadiusBox('xs', FBBorderRadius.xs),
              _RadiusBox('sm', FBBorderRadius.sm),
              _RadiusBox('md', FBBorderRadius.md),
              _RadiusBox('lg', FBBorderRadius.lg),
              _RadiusBox('full', FBBorderRadius.full),
            ],
          ),
          const SizedBox(height: FBSpacing.lg),
          const _SectionTitle('Type scale'),
          Text('Display', style: Theme.of(context).textTheme.displaySmall),
          Text('Headline', style: Theme.of(context).textTheme.headlineSmall),
          Text('Title', style: Theme.of(context).textTheme.titleLarge),
          Text('Body', style: Theme.of(context).textTheme.bodyLarge),
          Text('Label', style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: FBSpacing.sm),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: FBColors.textSecondaryLight),
      ),
    );
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch(this.label, this.color);
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color,
            borderRadius: FBBorderRadius.sm,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}

class _SpacingBar extends StatelessWidget {
  const _SpacingBar(this.label, this.size);
  final String label;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 32,
            child: Text(label, style: const TextStyle(fontSize: 12)),
          ),
          Container(width: size * 3, height: 12, color: FBColors.primary),
          const SizedBox(width: 8),
          Text(
            '${size.toInt()}px',
            style: const TextStyle(
              fontSize: 11,
              color: FBColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}

class _RadiusBox extends StatelessWidget {
  const _RadiusBox(this.label, this.radius);
  final String label;
  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: FBColors.primary, width: 1.5),
            borderRadius: radius,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}
