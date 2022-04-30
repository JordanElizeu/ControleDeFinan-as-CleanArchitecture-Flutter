import 'package:controle_financeiro/features/login/data/datasources/sign_in_firebase_datasource/sign_in_firebase_datasource.dart';
import 'package:controle_financeiro/features/login/data/model/sign_in_firebase_model.dart';
import 'package:controle_financeiro/features/login/domain/entities/sign_in_firebase_entity.dart';
import 'package:dartz/dartz.dart';

class SignInFirebaseDataSourceImp implements SignInFirebaseDataSource {
  @override
  Future<Either<Exception, SignInFirebaseModel>> call(
      {required SignInFirebaseEntity signInEntity}) {
    throw UnimplementedError();
  }
}
