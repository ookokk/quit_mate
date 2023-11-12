import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordVisibilityProvider = ChangeNotifierProvider(
  (ref) => PasswordVisibilityNotifier(),
);

class PasswordVisibilityNotifier extends ChangeNotifier {
  bool _isPasswordObscured = true;

  bool get isPasswordObscured => _isPasswordObscured;

  void togglePasswordVisibility() {
    _isPasswordObscured = !_isPasswordObscured;
    notifyListeners();
  }
}
