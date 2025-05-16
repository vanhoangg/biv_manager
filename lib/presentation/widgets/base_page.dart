import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:biv_manager/presentation/widgets/custom_app_bar.dart';
import 'package:biv_manager/presentation/widgets/base_stateful_widget.dart';

/// Base page widget that all pages will extend
abstract class BasePage extends BaseStatefulWidget {
  /// Constructor
  const BasePage({super.key});

  /// Build the page content
  Widget buildContent(BuildContext context);

  /// Build the page title
  String get pageTitle;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.pageTitle),
      body: ResponsiveBreakpoints.builder(
        child: _buildContentWithFallbacks(context),
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }

  Widget _buildContentWithFallbacks(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) {
      return Center(
        child: Text(
          'Localization not available',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }

    return widget.buildContent(context);
  }
}
