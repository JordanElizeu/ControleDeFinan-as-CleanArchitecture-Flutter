import 'package:dartz/dartz.dart';
import '../../../../domain/entities/sign_in_firebase_entity.dart';

abstract class SignInFirebaseDataSource {
  Future<Either<Exception, SignInFirebaseEntity>> call({
    required SignInFirebaseEntity signInEntity,
  });
}
