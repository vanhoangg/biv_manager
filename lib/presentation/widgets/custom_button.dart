import 'package:flutter/material.dart';

/// A custom button widget with modern design and loading state.
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final bool isText;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.isText = false,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonStyle = _getButtonStyle(theme);

    Widget buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  isText || isOutlined
                      ? theme.colorScheme.primary
                      : Colors.white,
                ),
              ),
            ),
          ),
        if (icon != null && !isLoading)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              icon,
              size: 18,
              color: isText || isOutlined
                  ? theme.colorScheme.primary
                  : Colors.white,
            ),
          ),
        Text(
          text,
          style: theme.textTheme.labelLarge?.copyWith(
            color:
                isText || isOutlined ? theme.colorScheme.primary : Colors.white,
          ),
        ),
      ],
    );

    if (width != null || height != null) {
      buttonChild = SizedBox(
        width: width,
        height: height,
        child: buttonChild,
      );
    }

    if (isText) {
      return TextButton(
        onPressed: isLoading ? null : onPressed,
        style: buttonStyle,
        child: buttonChild,
      );
    }

    if (isOutlined) {
      return OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: buttonStyle,
        child: buttonChild,
      );
    }

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: buttonStyle,
      child: buttonChild,
    );
  }

  ButtonStyle _getButtonStyle(ThemeData theme) {
    final baseStyle = isText
        ? TextButton.styleFrom(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          )
        : isOutlined
            ? OutlinedButton.styleFrom(
                padding: padding ??
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(8),
                ),
              )
            : ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? theme.colorScheme.primary,
                padding: padding ??
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(8),
                ),
              );

    return baseStyle.copyWith(
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return theme.colorScheme.onSurface.withOpacity(0.38);
        }
        return textColor ??
            (isText || isOutlined ? theme.colorScheme.primary : Colors.white);
      }),
    );
  }
}
