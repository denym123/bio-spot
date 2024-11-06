import 'package:biospot/core/core.dart';
import 'package:flutter/material.dart';

class PrimarySmallButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final String label;
  final IconData icon;
  final bool isLoading;
  const PrimarySmallButton(
      {super.key,
      this.width,
      this.height,
      this.onPressed,
      this.style,
      required this.label,
      required this.isLoading,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style ??
          context.styles.primaryButton.style?.copyWith(
            backgroundColor: WidgetStatePropertyAll(context.colors.primary),
            minimumSize: WidgetStateProperty.all<Size>(
              Size(width ?? 0, height ?? 48.h),
            ),
          ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          SizedBox(width: 8.w),
          Text(label,
              style: context.textStyles.regular.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
