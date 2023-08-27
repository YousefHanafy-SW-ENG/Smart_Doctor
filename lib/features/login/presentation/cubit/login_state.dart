part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class ChangePasswordVisibility extends LoginState {}

class ChangeLanguageState extends LoginState {}

class LoginSuccessFullyState extends LoginState {}
