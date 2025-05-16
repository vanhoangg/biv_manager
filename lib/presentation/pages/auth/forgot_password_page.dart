import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:biv_manager/core/constants/app_constants.dart';
import 'package:biv_manager/core/constants/string_constants.dart';
import 'package:biv_manager/presentation/blocs/auth/auth_bloc.dart';
import 'package:biv_manager/presentation/blocs/auth/auth_event.dart';
import 'package:biv_manager/presentation/blocs/auth/auth_state.dart';

/// Forgot password page
class ForgotPasswordPage extends StatefulWidget {
  /// Constructor
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.forgotPassword),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(StringConstants.passwordResetSuccess),
              ),
            );
            context.go(AppConstants.routeLogin);
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
                  const Text(
                    StringConstants.forgotPassword,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
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
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: state is AuthLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    ForgotPasswordRequested(
                                      email: _emailController.text,
                                    ),
                                  );
                            }
                          },
                    child: state is AuthLoading
                        ? const CircularProgressIndicator()
                        : const Text(StringConstants.resetPassword),
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
