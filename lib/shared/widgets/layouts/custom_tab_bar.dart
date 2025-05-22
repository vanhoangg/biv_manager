import '../base_widget.dart';
import 'package:flutter/material.dart';

/// A custom tab bar widget with modern design.
class CustomTabBar extends BaseStatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  final TabController? controller;
  final bool isScrollable;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final double indicatorWeight;
  final EdgeInsetsGeometry? labelPadding;
  final EdgeInsetsGeometry? padding;
  final double? height;

  const CustomTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.backgroundColor,
    this.indicatorColor,
    this.indicatorWeight = 2,
    this.labelPadding,
    this.padding,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: height ?? kToolbarHeight,
      padding: padding,
      color: backgroundColor ?? theme.colorScheme.surface,
      child: TabBar(
        tabs: tabs,
        controller: controller,
        isScrollable: isScrollable,
        indicatorColor: indicatorColor ?? theme.colorScheme.primary,
        indicatorWeight: indicatorWeight,
        labelColor: theme.colorScheme.primary,
        unselectedLabelColor: theme.colorScheme.onSurface.withAlpha(153),
        labelPadding:
            labelPadding ?? const EdgeInsets.symmetric(horizontal: 16),
        labelStyle: theme.textTheme.titleMedium,
        unselectedLabelStyle: theme.textTheme.titleMedium,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}

/// A custom tab widget with modern design.
class CustomTab extends BaseStatelessWidget {
  final String text;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;
  final double? height;

  const CustomTab({
    super.key,
    required this.text,
    this.icon,
    this.padding,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Tab(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon),
              const SizedBox(width: 8),
            ],
            Text(text),
          ],
        ),
      ),
    );
  }
}
