import 'package:flutter/material.dart';
import '../widgets/responsive.dart';

class ResponsiveExample extends StatelessWidget {
  const ResponsiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final type = context.screenType;

    return Scaffold(
      appBar: AppBar(title: const Text('FBResponsive Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Screen width: ${width.toStringAsFixed(0)}px',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text('Detected as: ${type.name}'),
            const SizedBox(height: 16),
            const Text(
              'FBResponsive swaps the widget below based on that width:',
            ),
            const SizedBox(height: 8),
            FBResponsive(
              mobile: (_) => const _Banner('Mobile layout', Colors.blue),
              tablet: (_) => const _Banner('Tablet layout', Colors.purple),
              desktop: (_) => const _Banner('Desktop layout', Colors.green),
            ),
            const SizedBox(height: 16),
            Text(
              'A column count picked with FBResponsiveValue: '
              '${const FBResponsiveValue(mobile: 1, tablet: 2, desktop: 4).resolve(context)}',
            ),
          ],
        ),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner(this.label, this.color);
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
