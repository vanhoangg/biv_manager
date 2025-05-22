import '../../../core/di/injection_container.dart' as di;
import '../../../domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/di/injection_container.dart';
import '../../../shared/index.dart';
import '../../blocs/settings/settings_bloc.dart';
import '../../blocs/settings/settings_event.dart';
import '../../blocs/settings/settings_state.dart';

/// MARK: SettingsPage - App configuration and preferences
class SettingsPage extends BasePage {
  /// Constructor
  const SettingsPage({super.key});

  @override
  String get pageTitle => 'settings';

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends BaseState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = sl<SettingsBloc>();
    final theme = Theme.of(context);
    final l10n = l10nOf(context);

    return BlocProvider<SettingsBloc>(
      create: (context) => bloc,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return CustomLoading(message: l10n.loading);
          }

          if (state is SettingsError) {
            return CustomError(
              message: state.message,
              onRetry: () {
                bloc.add(const LoadSettings());
              },
            );
          }

          return ListView(
            children: [
              ListTile(
                title: Text(l10n.theme, style: theme.textTheme.titleMedium),
                trailing: Switch(
                  value: themeManager.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    themeManager.toggleTheme();
                  },
                ),
              ),
              ListTile(
                title: Text(l10n.language, style: theme.textTheme.titleMedium),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (context) => LanguageSelectionDialog(
                      currentLocale: localizationService.locale,
                      onLanguageSelected: (locale) {
                        localizationService
                            .setCurrentLocale(locale.languageCode);
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(l10n.about, style: theme.textTheme.titleMedium),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  context.push('/about');
                },
              ),
              ListTile(
                title: Text(l10n.logout, style: theme.textTheme.titleMedium),
                trailing: const Icon(Icons.logout),
                onTap: () async {
                  /// MARK: Logout logic - clear session and sign out
                  final prefs = di.sl<SharedPreferences>();
                  await prefs.remove(AppConstants.storageKeys.token);
                  await prefs.remove(AppConstants.storageKeys.user);
                  await di.sl<AuthRepository>().signOut();
                  if (context.mounted) {
                    context.go(AppConstants.routes.login);
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
