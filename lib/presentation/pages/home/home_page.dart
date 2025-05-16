import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:biv_manager/core/constants/app_constants.dart';
import 'package:biv_manager/core/theme/theme_inherited_widget.dart';

/// Home page that contains the main navigation structure
class HomePage extends StatefulWidget {
  /// Constructor
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(MOBILE);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              ThemeInheritedWidget.of(context).themeManager.toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => context.push(AppConstants.routeProfile),
          ),
        ],
      ),
      drawer: isDesktop ? null : _buildDrawer(),
      body: Row(
        children: [
          if (isDesktop) _buildDrawer(),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: const [
                Center(child: Text('Dashboard')),
                Center(child: Text('Customers')),
                Center(child: Text('Transactions')),
                Center(child: Text('Reports')),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: 'Dashboard',
                ),
                NavigationDestination(
                  icon: Icon(Icons.people_outline),
                  selectedIcon: Icon(Icons.people),
                  label: 'Customers',
                ),
                NavigationDestination(
                  icon: Icon(Icons.receipt_long_outlined),
                  selectedIcon: Icon(Icons.receipt_long),
                  label: 'Transactions',
                ),
                NavigationDestination(
                  icon: Icon(Icons.bar_chart_outlined),
                  selectedIcon: Icon(Icons.bar_chart),
                  label: 'Reports',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
    );
  }

  Widget _buildDrawer() {
    return NavigationRail(
      extended: ResponsiveBreakpoints.of(context).largerThan(TABLET),
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.dashboard),
          label: Text('Dashboard'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.people),
          label: Text('Customers'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.receipt_long),
          label: Text('Transactions'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.bar_chart),
          label: Text('Reports'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          label: Text('Settings'),
        ),
      ],
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
