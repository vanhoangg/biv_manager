import '../../../core/di/injection_container.dart' as di;
import '../../../domain/repositories/auth_repository.dart';
import 'package:biv_manager/presentation/blocs/locale/locale_event.dart'
    show LocaleChanged;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/di/injection_container.dart';

import '../../../shared/index.dart';

import '../../blocs/locale/locale_bloc.dart';
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
    final String themeText = l10n?.theme ?? 'Theme';
    final String languageText = l10n?.language ?? 'Language';
    final String aboutText = l10n?.about ?? 'About';
    final String logoutText = l10n?.logout ?? 'Logout';
    bool isDarkMode = ThemeInheritedWidget.of(context).themeManager.themeMode ==
        ThemeMode.dark;
    return BlocProvider<SettingsBloc>(
      create: (context) => bloc,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return CustomLoading(message: l10n?.loading);
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
                title: Text(themeText, style: theme.textTheme.titleMedium),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    ThemeInheritedWidget.of(context).themeManager.toggleTheme();
                  },
                ),
              ),
              ListTile(
                title: Text(languageText, style: theme.textTheme.titleMedium),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (context) => LanguageSelectionDialog(
                      currentLocale: Localizations.localeOf(context),
                      onLanguageSelected: (locale) {
                        BlocProvider.of<LocaleBloc>(context)
                            .add(LocaleChanged(locale));
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(aboutText, style: theme.textTheme.titleMedium),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  context.push('/about');
                },
              ),
              ListTile(
                title: Text(logoutText, style: theme.textTheme.titleMedium),
                trailing: const Icon(Icons.logout),
                onTap: () async {
                  /// MARK: Logout logic - clear session and sign out
                  final prefs = di.sl<SharedPreferences>();
                  await prefs.remove(AppConstants.storageToken);
                  await prefs.remove(AppConstants.storageUser);
                  await di.sl<AuthRepository>().signOut();
                  if (context.mounted) {
                    context.go(AppConstants.routeLogin);
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
