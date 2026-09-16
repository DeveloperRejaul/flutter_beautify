import 'package:flutter/material.dart';

class FBAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final double size;
  final Color? backgroundColor;
  final ShapeBorder shape;
  final VoidCallback? onTap;

  const FBAvatar._({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 48,
    this.backgroundColor,
    required this.shape,
    this.onTap,
  });

  // Default → circular
  factory FBAvatar({
    Key? key,
    String? imageUrl,
    String? initials,
    double size = 48,
    Color? backgroundColor,
    VoidCallback? onTap,
  }) {
    return FBAvatar.circular(
      key: key,
      imageUrl: imageUrl,
      initials: initials,
      size: size,
      backgroundColor: backgroundColor,
      onTap: onTap,
    );
  }

  // -------- CIRCULAR --------
  factory FBAvatar.circular({
    Key? key,
    String? imageUrl,
    String? initials,
    double size = 48,
    Color? backgroundColor,
    VoidCallback? onTap,
  }) {
    return FBAvatar._(
      key: key,
      imageUrl: imageUrl,
      initials: initials,
      size: size,
      backgroundColor: backgroundColor,
      shape: const CircleBorder(),
      onTap: onTap,
    );
  }

  // -------- SQUARE --------
  factory FBAvatar.square({
    Key? key,
    String? imageUrl,
    String? initials,
    double size = 48,
    Color? backgroundColor,
    VoidCallback? onTap,
  }) {
    return FBAvatar._(
      key: key,
      imageUrl: imageUrl,
      initials: initials,
      size: size,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: onTap,
    );
  }

  // -------- ROUNDED --------
  factory FBAvatar.rounded({
    Key? key,
    String? imageUrl,
    String? initials,
    double size = 48,
    Color? backgroundColor,
    VoidCallback? onTap,
  }) {
    return FBAvatar._(
      key: key,
      imageUrl: imageUrl,
      initials: initials,
      size: size,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: onTap,
    );
  }

  Widget _buildContent(BuildContext context) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return ClipPath(
        clipper: ShapeBorderClipper(shape: shape),
        child: Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildInitials(context);
          },
        ),
      );
    }
    return _buildInitials(context);
  }

  Widget _buildInitials(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedBackground = backgroundColor ?? colorScheme.primary;

    return Container(
      decoration: ShapeDecoration(color: resolvedBackground, shape: shape),
      child: Center(
        child: Text(
          initials ?? '?',
          style: TextStyle(
            color: colorScheme.onPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final widget = SizedBox(
      width: size,
      height: size,
      child: _buildContent(context),
    );

    if (onTap != null) {
      return InkWell(onTap: onTap, customBorder: shape, child: widget);
    }

    return widget;
  }
}

class ShapeBorderClipper extends CustomClipper<Path> {
  final ShapeBorder shape;

  ShapeBorderClipper({required this.shape});

  @override
  Path getClip(Size size) {
    return shape.getOuterPath(Offset.zero & size);
  }

  @override
  bool shouldReclip(ShapeBorderClipper oldClipper) => oldClipper.shape != shape;
}
