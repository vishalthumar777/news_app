import 'package:flutter/material.dart';
import 'package:machers_assignment/services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {

  AuthViewModel() {
    _initialize();
  }
  final AuthService _authService = AuthService();
  bool _isSignedIn = false;

  bool get isSignedIn => _isSignedIn;

  Future<void> _initialize() async {
    await _checkSignInStatus();
  }

  Future<void> _checkSignInStatus() async {
    _isSignedIn = await _authService.isSignedIn();
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    _isSignedIn = await _authService.signInWithGoogle();
    notifyListeners();
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _isSignedIn = false;
    notifyListeners();
  }
}
