part of 'login_bloc.dart';

abstract class LoginState extends Equatable {}

class LoginStarting extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});

  @override
  List<Object?> get props => [message];
}
