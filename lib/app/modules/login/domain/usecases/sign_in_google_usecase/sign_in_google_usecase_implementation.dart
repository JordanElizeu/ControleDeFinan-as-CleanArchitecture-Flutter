import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../shared/domain/failures/failures.dart';
import '../../repositories/login_repository.dart';
import '../usecases.dart';

class SignInGoogleUseCaseImplementation implements SignInGoogleUseCase {
  final LoginRepository _loginRepository;

  SignInGoogleUseCaseImplementation(this._loginRepository);

  @override
  Future<Either<GeneralFailure, User>> call() async {
    return await _loginRepository.signInGoogle();
  }
}
