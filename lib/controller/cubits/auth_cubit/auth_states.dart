import 'package:e_manazel/models/amdin_login_model.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AdminLoginLoadingState extends AuthStates {}

class AdminLoginSuccessState extends AuthStates {
  final AdminLoginModel adminLoginModel;

  AdminLoginSuccessState({
    required this.adminLoginModel,
  });
}

class AdminLoginErrorState extends AuthStates {}

class LoginChangePasswordVisibilityState extends AuthStates {}
