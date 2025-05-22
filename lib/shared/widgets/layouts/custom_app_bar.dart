import '../../theme/theme_inherited_widget.dart';
import '../base_widget.dart';
import 'package:flutter/material.dart';

/// A custom app bar widget with modern design.
class CustomAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
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
  final double? scrolledUnderElevation;
  final Color? surfaceTintColor;
  final Widget? flexibleSpace;

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
    this.scrolledUnderElevation,
    this.surfaceTintColor,
    this.flexibleSpace,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: Text(title ?? ""),
      actions: actions ??
          [
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                ThemeInheritedWidget.of(context).themeManager.toggleTheme();
              },
            ),
          ],
      leading: leading,
      centerTitle: centerTitle,
      elevation: elevation,
      backgroundColor: backgroundColor ?? theme.colorScheme.surface,
      titleSpacing: titleSpacing,
      toolbarHeight: toolbarHeight,
      bottom: bottomWidget,
      scrolledUnderElevation: scrolledUnderElevation,
      surfaceTintColor: surfaceTintColor,
      flexibleSpace: flexibleSpace,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        (toolbarHeight ?? kToolbarHeight) +
            (bottomWidget?.preferredSize.height ?? 0),
      );
}
