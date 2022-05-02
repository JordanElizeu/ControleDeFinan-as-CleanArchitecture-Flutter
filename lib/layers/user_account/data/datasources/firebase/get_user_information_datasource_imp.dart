import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_financeiro/layers/user_account/data/datasources/firebase/get_user_information_datasource.dart';
import 'package:controle_financeiro/layers/user_account/data/model/user_information_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserInformationDataSourceImp implements GetUserInformationDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  GetUserInformationDataSourceImp(this._firebaseAuth, this._firebaseFirestore);

  @override
  Future<Either<Exception, UserInformationModel>> call() async {
    try {
      final resultUserInformation = await _firebaseFirestore
          .collection('Account')
          .doc(_firebaseAuth.currentUser?.uid)
          .collection('Authentication')
          .doc('UserInformation')
          .get();
      return Right(UserInformationModel.fromMap(resultUserInformation.data()));
    } catch (e) {
      return Left(Exception('Erro ao pegar informações de usuário'));
    }
  }
}
