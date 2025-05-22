import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../shared/widgets/base_widget.dart';
import 'navigation_type.dart';

/// Home page that contains the main navigation structure
class HomePage extends BaseStatefulWidget {
  /// Constructor
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(MOBILE);
    if (l10n == null) return const SizedBox.shrink();

    return Scaffold(
      // appBar: const CustomAppBar(title: 'Home'),
      body: Row(
        children: [
          if (isDesktop) _buildDrawer(),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: NavigationType.values.map((type) => type.page).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : NavigationBar(
              backgroundColor: theme.colorScheme.surface,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: NavigationType.values
                  .map((type) => type.toDestination())
                  .toList(),
            ),
    );
  }

  Widget _buildDrawer() {
    return NavigationRail(
      extended: ResponsiveBreakpoints.of(context).largerThan(TABLET),
      destinations: NavigationType.values
          .map((type) => type.toRailDestination())
          .toList(),
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
