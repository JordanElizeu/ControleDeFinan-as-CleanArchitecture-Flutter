import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';

abstract class SignInUseCase {
  Future<Either<Exception, SignInFirebaseEntity>> call({
    required SignInFirebaseEntity signInEntity,
  });
}
