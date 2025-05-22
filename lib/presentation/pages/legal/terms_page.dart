import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../shared/index.dart';

/// Terms and Conditions Page
class TermsPage extends BaseStatelessWidget {
  /// Constructor
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rtlService = GetIt.I<RTLService>();
    final date = DateTime.now().toString().split(' ')[0];
    final l10n = l10nOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.termsAndConditions),
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
                  l10n.termsAndConditions,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.termsLastUpdated(date),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 24),
                _buildSection(
                  context,
                  l10n.termsAgreement,
                  l10n.termsAgreementContent(AppConstants.appName),
                ),
                _buildSection(
                  context,
                  l10n.termsLicense,
                  l10n.termsLicenseContent,
                ),
                _buildSection(
                  context,
                  l10n.termsAccount,
                  l10n.termsAccountContent,
                ),
                _buildSection(
                  context,
                  l10n.termsDisclaimer,
                  l10n.termsDisclaimerContent(AppConstants.appName),
                ),
                _buildSection(
                  context,
                  l10n.termsLimitations,
                  l10n.termsLimitationsContent(AppConstants.appName),
                ),
                _buildSection(
                  context,
                  l10n.termsRevisions,
                  l10n.termsRevisionsContent(AppConstants.appName),
                ),
                _buildSection(
                  context,
                  l10n.termsGoverningLaw,
                  l10n.termsGoverningLawContent,
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    l10n.termsContact,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    l10n.termsContactContent,
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
    String title,
    String content,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
