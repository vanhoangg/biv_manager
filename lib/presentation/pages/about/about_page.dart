/// about_page.dart
/// Author: Biv Team
/// Purpose: Displays app information and credits.
library;

import 'package:flutter/material.dart';
import '../../../shared/index.dart';

/// MARK: AboutPage - Shows app info and credits
class AboutPage extends BasePage {
  /// Constructor
  const AboutPage({super.key});

  @override
  String get pageTitle => 'About';

  @override
  State<StatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends BaseState<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.pageTitle,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Text(
            AppConfig.appName,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Version: ${AppConfig.appVersion}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          Text(
            'Biv Manager is a debt management application designed to help you track and manage your finances efficiently.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          Text(
            '© 2024 Biv Team. All rights reserved.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Divider(height: 32),

          /// MARK: Advanced About links
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy Policy'),
            onTap: () {
              // TODO: Replace with actual privacy policy URL
              // launchUrl(Uri.parse('https://bivmanager.com/privacy'));
            },
          ),
          ListTile(
            leading: const Icon(Icons.article_outlined),
            title: const Text('Terms of Service'),
            onTap: () {
              // TODO: Replace with actual terms URL
              // launchUrl(Uri.parse('https://bivmanager.com/terms'));
            },
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('Open Source Licenses'),
            onTap: () {
              showLicensePage(
                  context: context, applicationName: AppConfig.appName);
            },
          ),
        ],
      ),
    );
  }
}
