import 'package:flutter/material.dart';
import 'package:customer/index.dart';
import 'package:settings/index.dart';
import 'package:transaction/index.dart';

import '../dashboard/dashboard_page.dart';
import '../reports/reports_page.dart';

/// Navigation type enum
enum NavigationType {
  /// Dashboard page
  dashboard(
    icon: Icons.dashboard_outlined,
    selectedIcon: Icons.dashboard,
    label: 'Dashboard',
    page: DashboardPage(),
  ),

  /// Customers page
  customers(
    icon: Icons.people_outline,
    selectedIcon: Icons.people,
    label: 'Customers',
    page: CustomersPage(),
  ),

  /// Transactions page
  transactions(
    icon: Icons.receipt_long_outlined,
    selectedIcon: Icons.receipt_long,
    label: 'Transactions',
    page: TransactionsPage(),
  ),

  /// Reports page
  reports(
    icon: Icons.bar_chart_outlined,
    selectedIcon: Icons.bar_chart,
    label: 'Reports',
    page: ReportsPage(),
  ),

  /// Settings page
  settings(
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings,
    label: 'Settings',
    page: SettingsPage(),
  );

  /// Navigation icon
  final IconData icon;

  /// Selected navigation icon
  final IconData selectedIcon;

  /// Navigation label
  final String label;

  /// Page widget
  final Widget page;

  /// Constructor
  const NavigationType({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.page,
  });

  /// Convert to NavigationDestination
  NavigationDestination toDestination() {
    return NavigationDestination(
      icon: Icon(icon),
      selectedIcon: Icon(selectedIcon),
      label: label,
    );
  }

  /// Convert to NavigationRailDestination
  NavigationRailDestination toRailDestination() {
    return NavigationRailDestination(
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
