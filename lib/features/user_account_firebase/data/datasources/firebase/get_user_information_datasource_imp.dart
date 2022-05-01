import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_financeiro/features/user_account_firebase/data/datasources/firebase/get_user_information_datasource.dart';
import 'package:controle_financeiro/features/user_account_firebase/data/model/user_information_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserInformationDataSourceImp implements GetUserInformationDataSource {
  final collectionReference = FirebaseFirestore.instance.collection('Account');
  final FirebaseAuth _firebaseAuth;

  GetUserInformationDataSourceImp(this._firebaseAuth);

  @override
  Future<Either<Exception, UserInformationModel>> call() async {
    try {
      final resultUserInformation = await collectionReference
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
