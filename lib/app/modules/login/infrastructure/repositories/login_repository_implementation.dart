import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../shared/domain/failures/failures.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class LoginRepositoryImplementation implements LoginRepository {
  final SignInGoogleDatasource _signInGoogleDataSource;

  LoginRepositoryImplementation(this._signInGoogleDataSource);

  @override
  Future<Either<GeneralFailure, User>> signInGoogle() async {
    try {
      return Right(await _signInGoogleDataSource.signInGoogle());
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case 'account-exists-with-different-credential':
          return Left(AccountExistsWithDifferentCredentialFailure());
        case 'invalid-credential':
          return Left(InvalidCredentialFailure());
        case 'operation-not-allowed':
          return Left(OperationNotAllowedFailure());
        case 'user-disabled':
          return Left(UserDisabledFailure());
        case 'user-not-found':
          return Left(UserNotFoundFailure());
        case 'wrong-password':
          return Left(WrongPasswordFailure());
        case 'invalid-verification-code':
          return Left(InvalidVerificationCodeFailure());
        case 'invalid-verification-id':
          return Left(InvalidVerificationIdFailure());
        case 'network-request-failed':
          return Left(NetworkRequestFailure());
        default:
          return Left(GenericFailure());
      }
    } on Exception {
      return Left(GenericFailure());
    }
  }
}
