part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SuccessToPickImageState extends AuthState {}

class FailedToPickImageState extends AuthState {
  final String msg;

  FailedToPickImageState({required this.msg});
}

// register

class SuccessToCreateUserState extends AuthState {}

class LoadingToCreateUserState extends AuthState {}

class FailedToCreateUseState extends AuthState {
  final String msg;

  FailedToCreateUseState({required this.msg});
}

// login state
class SuccessToLoginUserState extends AuthState {}

class LoadingToLoginUserState extends AuthState {}

class FailedToLoginUseState extends AuthState {
  final String msg;

  FailedToLoginUseState({required this.msg});
}

class FailedToSaveUserDataToFirebaseFirestore extends AuthState {
  final String msg;

  FailedToSaveUserDataToFirebaseFirestore(this.msg);
}

class SuccessToSaveUserDataToFirebaseFirestore extends AuthState {}
