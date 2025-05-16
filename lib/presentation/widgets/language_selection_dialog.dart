import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:biv_manager/presentation/widgets/custom_dialog.dart';
import 'package:biv_manager/presentation/widgets/custom_button.dart';

/// Dialog for selecting application language
class LanguageSelectionDialog extends StatelessWidget {
  /// Current locale
  final Locale currentLocale;

  /// Callback when language is selected
  final void Function(Locale) onLanguageSelected;

  /// Constructor
  const LanguageSelectionDialog({
    super.key,
    required this.currentLocale,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return const SizedBox.shrink();

    return CustomDialog(
      title: l10n.language,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LanguageOption(
            locale: const Locale('en'),
            name: 'English',
            isSelected: currentLocale.languageCode == 'en',
            onTap: () => onLanguageSelected(const Locale('en')),
          ),
          const SizedBox(height: 8),
          _LanguageOption(
            locale: const Locale('vi'),
            name: 'Tiếng Việt',
            isSelected: currentLocale.languageCode == 'vi',
            onTap: () => onLanguageSelected(const Locale('vi')),
          ),
        ],
      ),
      actions: [
        CustomButton(
          text: l10n.cancel,
          isText: true,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final Locale locale;
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.locale,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: isSelected ? const Icon(Icons.check) : null,
      onTap: onTap,
    );
  }
}
