import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInGoogleUseCase {
  Future<Either<Exception, User>> call();
}
