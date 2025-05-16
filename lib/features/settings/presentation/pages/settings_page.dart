import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:biv_manager/presentation/blocs/theme/theme_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:biv_manager/presentation/blocs/theme/theme_state.dart';
import 'package:biv_manager/presentation/blocs/theme/theme_event.dart';

/// Settings page
class SettingsPage extends StatelessWidget {
  /// Constructor
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.theme),
            trailing: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Switch(
                  value: state.isDarkMode,
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
            title: Text(l10n.language),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Implement language selection
            },
          ),
          ListTile(
            title: Text(l10n.about),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Implement about page
            },
          ),
        ],
      ),
    );
  }
}
