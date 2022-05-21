import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../infrastructure/datasources/datasources.dart';
import '../infrastructure/models/models.dart';

class GetUserInformationDataSourceImplementation
    implements GetUserInformationDatasource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  GetUserInformationDataSourceImplementation(
      this._firebaseAuth, this._firebaseFirestore);

  @override
  Future<Either<Exception, UserInformationModel>> getUSerInformation() async {
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
