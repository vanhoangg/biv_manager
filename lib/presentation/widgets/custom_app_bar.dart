import 'package:flutter/material.dart';

/// A custom app bar widget with modern design.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final double elevation;
  final Color? backgroundColor;
  final Widget? bottom;
  final double? titleSpacing;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottomWidget;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.elevation = 0,
    this.backgroundColor,
    this.bottom,
    this.titleSpacing,
    this.toolbarHeight,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: title != null ? Text(title!) : null,
      actions: actions,
      leading: leading,
      centerTitle: centerTitle,
      elevation: elevation,
      backgroundColor: backgroundColor ?? theme.colorScheme.surface,
      titleSpacing: titleSpacing,
      toolbarHeight: toolbarHeight,
      bottom: bottomWidget,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        (toolbarHeight ?? kToolbarHeight) +
            (bottomWidget?.preferredSize.height ?? 0),
      );
}
