import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:biv_manager/core/constants/app_constants.dart';
import 'package:biv_manager/core/constants/string_constants.dart';
import 'package:biv_manager/presentation/blocs/auth/auth_bloc.dart';
import 'package:biv_manager/presentation/blocs/auth/auth_event.dart';
import 'package:biv_manager/presentation/blocs/auth/auth_state.dart';

/// Register page
class RegisterPage extends StatefulWidget {
  /// Constructor
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.register),
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
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                        labelText: StringConstants.confirmPassword),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StringConstants.errorInvalidPassword;
                      }
                      if (value != _passwordController.text) {
                        return StringConstants.passwordsDoNotMatch;
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
                                    RegisterRequested(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                            }
                          },
                    child: state is AuthLoading
                        ? const CircularProgressIndicator()
                        : const Text(StringConstants.register),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go(AppConstants.routeLogin);
                    },
                    child: const Text(StringConstants.login),
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
