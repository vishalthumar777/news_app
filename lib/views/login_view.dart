import 'package:flutter/material.dart';
import 'package:machers_assignment/utils/app_text_styles.dart';
import 'package:machers_assignment/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: authViewModel.signInWithGoogle,
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
}
