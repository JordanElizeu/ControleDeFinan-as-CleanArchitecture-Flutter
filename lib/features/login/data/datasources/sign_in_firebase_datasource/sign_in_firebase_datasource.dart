import 'package:controle_financeiro/features/login/data/model/sign_in_firebase_model.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/entities/sign_in_firebase_entity.dart';

abstract class SignInFirebaseDataSource {
  Future<Either<Exception, SignInFirebaseModel>> call({
    required SignInFirebaseEntity signInEntity,
  });
}
