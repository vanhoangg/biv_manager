import '../base_widget.dart';
import 'package:flutter/material.dart';

/// A custom dialog widget with modern design.
class CustomDialog extends BaseStatelessWidget {
  final String? title;
  final Widget content;
  final List<Widget>? actions;
  final bool showCloseButton;
  final EdgeInsetsGeometry? contentPadding;
  final double? maxWidth;
  final double? maxHeight;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;

  const CustomDialog({
    super.key,
    this.title,
    required this.content,
    this.actions,
    this.showCloseButton = true,
    this.contentPadding,
    this.maxWidth,
    this.maxHeight,
    this.borderRadius,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: backgroundColor ?? theme.dialogTheme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? 560,
          maxHeight: maxHeight ?? 600,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null || showCloseButton)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (title != null)
                      Expanded(
                        child: Text(
                          title!,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    if (showCloseButton)
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                  ],
                ),
              ),
            Flexible(
              child: SingleChildScrollView(
                padding: contentPadding ?? const EdgeInsets.all(24),
                child: content,
              ),
            ),
            if (actions != null)
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
