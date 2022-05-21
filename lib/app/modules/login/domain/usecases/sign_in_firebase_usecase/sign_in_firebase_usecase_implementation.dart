import 'package:dartz/dartz.dart';

import '../../../../../shared/utils/utils.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class SignInUseCaseImplementation implements SignInUseCase {
  final LoginRepository _loginRepository;

  SignInUseCaseImplementation(this._loginRepository);

  @override
  Future<Either<Exception, SignInFirebaseEntity>> call(
      {required SignInFirebaseEntity signInEntity}) async {
    if (EmailValidation.validateEmail(signInEntity.email) &&
        signInEntity.password.length >= 6) {
      return _loginRepository.signInFirebase(signInEntity: signInEntity);
    } else {
      return Left(Exception('erro ocorrido'));
    }
  }
}
