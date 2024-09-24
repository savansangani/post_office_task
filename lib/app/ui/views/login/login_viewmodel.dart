import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import '../home/home_view.dart';

enum AuthType {
  login,
  signup,
}

class LoginViewModel extends BaseViewModel {
  final bool isSignUpMode;
  LoginViewModel({this.isSignUpMode = false}) {
    selectedAuthType = isSignUpMode ? AuthType.signup : AuthType.login;
  }
  AuthType selectedAuthType = AuthType.login;
  bool get isLogin => selectedAuthType == AuthType.login;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  Future<void> handleAuthTypeChange(AuthType type) async {
    isPasswordVisible = false;
    selectedAuthType = type;
    notifyListeners();
  }

  void handlePasswordVisibilityChange() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void handleConfirmPasswordVisibilityChange() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  void handleLoginButtonTap() {
    emailController.clear();
    passwordController.clear();
    Get.to(() => const HomeView());
  }

  void handleSignUpButtonTap() async {
    emailController.clear();
    passwordController.clear();
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("LogIn", true);

    Get.to(() => const HomeView());
  }
}
