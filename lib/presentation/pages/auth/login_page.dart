import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:biv_manager/core/constants/app_constants.dart';
import 'package:biv_manager/core/constants/string_constants.dart';
import 'package:biv_manager/presentation/blocs/auth/auth_bloc.dart';
import 'package:biv_manager/presentation/blocs/auth/auth_event.dart';
import 'package:biv_manager/presentation/blocs/auth/auth_state.dart';
import 'package:biv_manager/presentation/widgets/custom_app_bar.dart';
import 'package:biv_manager/presentation/widgets/custom_text_field.dart';

/// Login page
class LoginPage extends StatefulWidget {
  /// Constructor
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.login),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.go(AppConstants.routeHome);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration:
                        const InputDecoration(labelText: StringConstants.email),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StringConstants.errorInvalidEmail;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        labelText: StringConstants.password),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StringConstants.errorInvalidPassword;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: state is AuthLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    LoginRequested(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                            }
                          },
                    child: state is AuthLoading
                        ? const CircularProgressIndicator()
                        : const Text(StringConstants.login),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go(AppConstants.routeRegister);
                    },
                    child: const Text(StringConstants.register),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go(AppConstants.routeForgotPassword);
                    },
                    child: const Text(StringConstants.forgotPassword),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
