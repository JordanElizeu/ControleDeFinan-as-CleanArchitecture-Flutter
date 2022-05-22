import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../shared/domain/failures/failures.dart';

abstract class LoginRepository {
  Future<Either<GeneralFailure, User>> signInGoogle();
}
