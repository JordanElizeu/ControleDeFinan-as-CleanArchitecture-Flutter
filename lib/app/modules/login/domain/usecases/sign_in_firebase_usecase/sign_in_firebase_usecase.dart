import 'package:dartz/dartz.dart';

import '../../entities/sign_in_firebase_entity.dart';

abstract class SignInUseCase {
  Future<Either<Exception, SignInFirebaseEntity>> call({
    required SignInFirebaseEntity signInEntity,
  });
}
