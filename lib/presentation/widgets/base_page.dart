import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Base page widget that all pages will extend
abstract class BasePage extends StatelessWidget {
  /// Constructor
  const BasePage({super.key});

  /// Build the page content
  Widget buildContent(BuildContext context);

  /// Build the page title
  String get pageTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: ResponsiveBreakpoints.builder(
        child: buildContent(context),
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
