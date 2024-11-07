import 'package:biospot/core/core.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PrimaryButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final String label;
  final bool isLoading;
  const PrimaryButton(
      {super.key,
      this.width,
      this.height,
      this.onPressed,
      this.style,
      required this.label,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? () {} : onPressed,
      style: style ??
          context.styles.primaryButton.style?.copyWith(
            minimumSize: WidgetStateProperty.all<Size>(
              Size(width ?? double.infinity, height ?? 48.h),
            ),
          ),
      child: isLoading
          ? LoadingAnimationWidget.stretchedDots(
              color: Colors.white, size: 24.h)
          : Text(label),
    );
  }
}
