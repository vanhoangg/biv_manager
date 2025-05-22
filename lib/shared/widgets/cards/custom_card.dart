import '../base_widget.dart';
import 'package:flutter/material.dart';

/// A custom card widget with modern design and optional actions.
class CustomCard extends BaseStatelessWidget {
  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;

  const CustomCard({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.padding,
    this.onTap,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);

    return Card(
      elevation: elevation ?? 2,
      color: backgroundColor ?? currentTheme.cardTheme.color,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null || actions != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      if (title != null)
                        Expanded(
                          child: Text(
                            title!,
                            style: currentTheme.textTheme.titleLarge,
                          ),
                        ),
                      if (actions != null) ...actions!,
                    ],
                  ),
                ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
