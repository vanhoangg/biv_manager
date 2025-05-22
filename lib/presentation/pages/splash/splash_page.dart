import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            Text(
              AppConfig.appName,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
