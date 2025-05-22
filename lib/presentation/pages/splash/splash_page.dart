import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../shared/index.dart';

/// Splash page that shows when the app is loading
class SplashPage extends BaseStatelessWidget {
  /// Creates a new instance of [SplashPage]
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: ResponsiveValue<double>(
                context,
                conditionalValues: [
                  Condition.smallerThan(name: TABLET, value: 150.0),
                  Condition.largerThan(name: DESKTOP, value: 250.0),
                ],
                defaultValue: 200.0,
              ).value,
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
