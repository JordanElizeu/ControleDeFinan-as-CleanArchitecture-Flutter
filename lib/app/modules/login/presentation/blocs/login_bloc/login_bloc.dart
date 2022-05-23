import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';

import '../../../domain/usecases/usecases.dart';
import '../../../../../../i18n/constants_i18n.dart';
import '../../../domain/failures/authentication_failure.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._signInGoogleUseCase) : super(LoginStarting()) {
    on<LoginSignInWithGoogleEvent>(_signInWithGoogle);
  }

  final SignInGoogleUseCase _signInGoogleUseCase;

  Future<void> _signInWithGoogle(LoginSignInWithGoogleEvent event, emit) async {
    final result = await _signInGoogleUseCase.call();
    result.fold(
      (error) {
        switch (error.runtimeType) {
          case AccountExistsWithDifferentCredentialFailure:
            emit(LoginError(message: ConstantI18n.emailRegisteredError.i18n()));
            emit(LoginStarting());
            break;
          case InvalidCredentialFailure:
            emit(LoginError(
                message: ConstantI18n.invalidCredentialFailure.i18n()));
            emit(LoginStarting());
            break;
          case InvalidVerificationCodeFailure:
            emit(
                LoginError(message: ConstantI18n.invalidCredentialCode.i18n()));
            emit(LoginStarting());
            break;
          case InvalidVerificationIdFailure:
            emit(LoginError(message: ConstantI18n.credentialIdNotValid.i18n()));
            emit(LoginStarting());
            break;
          case OperationNotAllowedFailure:
            emit(LoginError(
                message: ConstantI18n.operationNotAllowedError.i18n()));
            emit(LoginStarting());
            break;
          case UserDisabledFailure:
            emit(LoginError(message: ConstantI18n.userAccDeactivated.i18n()));
            emit(LoginStarting());
            break;
          case UserNotFoundFailure:
            emit(LoginError(message: ConstantI18n.userNotFound.i18n()));
            emit(LoginStarting());
            break;
          case WrongPasswordFailure:
            emit(LoginError(message: ConstantI18n.wrongPassword.i18n()));
            emit(LoginStarting());
            break;
          case NetworkRequestFailure:
            emit(LoginError(message: ConstantI18n.networkFailure.i18n()));
            emit(LoginStarting());
            break;
          default:
            emit(LoginError(message: ConstantI18n.unknownError.i18n()));
            break;
        }
      },
      (user) => emit(LoginSuccess(user: user)),
    );
  }
}
