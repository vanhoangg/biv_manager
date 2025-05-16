import 'package:flutter/material.dart';

/// A custom drawer widget with modern design.
class CustomDrawer extends StatelessWidget {
  final Widget? header;
  final List<Widget> children;
  final Color? backgroundColor;
  final double elevation;
  final double width;
  final EdgeInsetsGeometry? padding;

  const CustomDrawer({
    super.key,
    this.header,
    required this.children,
    this.backgroundColor,
    this.elevation = 16,
    this.width = 304,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      backgroundColor: backgroundColor ?? theme.colorScheme.surface,
      elevation: elevation,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (header != null) header!,
          Expanded(
            child: ListView(
              padding: padding ?? EdgeInsets.zero,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}

/// A custom drawer header widget with modern design.
class CustomDrawerHeader extends StatelessWidget {
  final Widget? child;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final double? height;

  const CustomDrawerHeader({
    super.key,
    this.child,
    this.decoration,
    this.padding,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: height ?? 176,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: decoration ??
          BoxDecoration(
            color: theme.colorScheme.primary,
          ),
      child: child,
    );
  }
}

/// A custom drawer item widget with modern design.
class CustomDrawerItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool selected;
  final Color? selectedColor;
  final Color? unselectedColor;
  final EdgeInsetsGeometry? padding;

  const CustomDrawerItem({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
    this.selected = false,
    this.selectedColor,
    this.unselectedColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: icon != null
          ? Icon(
              icon,
              color: selected
                  ? (selectedColor ?? theme.colorScheme.primary)
                  : (unselectedColor ?? theme.colorScheme.onSurface),
            )
          : null,
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: selected
              ? (selectedColor ?? theme.colorScheme.primary)
              : (unselectedColor ?? theme.colorScheme.onSurface),
        ),
      ),
      onTap: onTap,
      selected: selected,
      selectedTileColor: theme.colorScheme.primaryContainer.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
