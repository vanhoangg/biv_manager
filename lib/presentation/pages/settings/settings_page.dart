import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:biv_manager/presentation/widgets/base_page.dart';
import 'package:biv_manager/presentation/widgets/custom_loading.dart';
import 'package:biv_manager/presentation/widgets/custom_error.dart';
import 'package:biv_manager/presentation/widgets/language_selection_dialog.dart';
import 'package:biv_manager/presentation/blocs/settings/settings_bloc.dart';
import 'package:biv_manager/presentation/blocs/settings/settings_state.dart';
import 'package:biv_manager/presentation/blocs/theme/theme_bloc.dart';
import 'package:biv_manager/presentation/blocs/theme/theme_event.dart';
import 'package:biv_manager/presentation/blocs/locale/locale_bloc.dart';
import 'package:biv_manager/presentation/blocs/locale/locale_event.dart';

/// Settings page for app configuration
class SettingsPage extends BasePage {
  /// Constructor
  const SettingsPage({super.key});

  @override
  String get pageTitle => l10n?.settings ?? 'Settings';

  @override
  Widget buildContent(BuildContext context) {
    if (l10n == null) return const SizedBox.shrink();

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return CustomLoading(message: l10n!.loading);
        }

        if (state is SettingsError) {
          return CustomError(
            message: state.message,
            onRetry: () {
              context.read<SettingsBloc>().add(LoadSettings());
            },
          );
        }

        return ListView(
          children: [
            ListTile(
              title: Text(l10n!.theme, style: theme.textTheme.titleMedium),
              trailing: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, themeState) {
                  return Switch(
                    value: themeState.isDarkMode,
                    onChanged: (value) {
                      context.read<ThemeBloc>().add(
                            value ? SetDarkTheme() : SetLightTheme(),
                          );
                    },
                  );
                },
              ),
            ),
            ListTile(
              title: Text(l10n!.language, style: theme.textTheme.titleMedium),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (context) => LanguageSelectionDialog(
                    currentLocale: Localizations.localeOf(context),
                    onLanguageSelected: (locale) {
                      context.read<LocaleBloc>().add(LocaleChanged(locale));
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text(l10n!.about, style: theme.textTheme.titleMedium),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Implement about page
              },
            ),
            ListTile(
              title: Text(l10n!.logout, style: theme.textTheme.titleMedium),
              trailing: const Icon(Icons.logout),
              onTap: () {
                // TODO: Implement logout
              },
            ),
          ],
        );
      },
    );
  }
}
