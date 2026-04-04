import 'package:flutter/material.dart';

class FBAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final double size;
  final Color backgroundColor;
  final ShapeBorder shape;
  final VoidCallback? onTap;

  const FBAvatar._({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 48,
    this.backgroundColor = Colors.blue,
    required this.shape,
    this.onTap,
  });

  // Default → circular
  factory FBAvatar({
    Key? key,
    String? imageUrl,
    String? initials,
    double size = 48,
    Color backgroundColor = Colors.blue,
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
    Color backgroundColor = Colors.blue,
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
    Color backgroundColor = Colors.blue,
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
    Color backgroundColor = Colors.blue,
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

  Widget _buildContent() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return ClipPath(
        clipper: ShapeBorderClipper(shape: shape),
        child: Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildInitials();
          },
        ),
      );
    }
    return _buildInitials();
  }

  Widget _buildInitials() {
    return Container(
      decoration: ShapeDecoration(color: backgroundColor, shape: shape),
      child: Center(
        child: Text(
          initials ?? '?',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final widget = SizedBox(width: size, height: size, child: _buildContent());

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
