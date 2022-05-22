import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../shared/domain/failures/failures.dart';

abstract class SignInGoogleUseCase {
  Future<Either<GeneralFailure, User>> call();
}
