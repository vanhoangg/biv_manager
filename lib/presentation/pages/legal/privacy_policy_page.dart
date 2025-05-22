import 'package:biv_manager/shared/index.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

/// Privacy Policy Page
class PrivacyPolicyPage extends BaseStatelessWidget {
  /// Constructor
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rtlService = GetIt.I<RTLService>();
    final date = DateTime.now().toString().split(' ')[0];
    final l10n = l10nOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.privacyPolicy),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: rtlService.getDirectionalPadding(
          start: 16.0,
          end: 16.0,
          top: 24.0,
          bottom: 24.0,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.privacyPolicy,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.privacyPolicyLastUpdated(date),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 24),
                _buildSection(
                  context,
                  l10n.privacyPolicyIntroduction(AppConstants.appName),
                ),
                _buildSection(
                  context,
                  l10n.privacyPolicyDataCollection,
                  l10n.privacyPolicyDataCollectionContent,
                ),
                _buildSection(
                  context,
                  l10n.privacyPolicyDataUsage,
                  l10n.privacyPolicyDataUsageContent,
                ),
                _buildSection(
                  context,
                  l10n.privacyPolicySecurity,
                  l10n.privacyPolicySecurityContent,
                ),
                _buildSection(
                  context,
                  l10n.privacyPolicyRights,
                  l10n.privacyPolicyRightsContent,
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    l10n.privacyPolicyContact,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    l10n.privacyPolicyContactContent,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String content, [
    String? title,
  ]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
          ],
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
