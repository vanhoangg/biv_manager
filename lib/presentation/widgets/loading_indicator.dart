import 'package:flutter/material.dart';

/// Widget for displaying loading state
class LoadingIndicator extends StatelessWidget {
  /// Constructor
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
