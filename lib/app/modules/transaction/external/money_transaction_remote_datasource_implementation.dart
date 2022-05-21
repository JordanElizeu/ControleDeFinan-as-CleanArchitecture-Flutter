import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import '../domain/entities/transaction_entity.dart';
import '../infrastructure/datasources/firebase/money_transaction_remote_datasource.dart';
import '../infrastructure/models/transaction_model.dart';

class MoneyTransactionRemoteDataSourceImplementation
    implements MoneyTransactionRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _auth;
  final Uuid _uuid;

  MoneyTransactionRemoteDataSourceImplementation(
    this._auth,
    this._uuid,
    this._firebaseFirestore,
  );

  @override
  Future<Either<Exception, TransactionEntity>> moneyDeposit(
      {required TransactionEntity transactionEntity}) async {
    try {
      final generateId = _uuid.v1();
      await _firebaseFirestore
          .collection('Account')
          .doc(_auth.currentUser!.uid)
          .collection('Finances')
          .doc('Transaction')
          .collection('Deposit')
          .doc(generateId)
          .set({
        'title': transactionEntity.title,
        'description': transactionEntity.description,
        'value': transactionEntity.valueMoney,
        'id': generateId,
      });
      return Right(transactionEntity);
    } catch (e) {
      return Left(Exception('Erro: $e'));
    }
  }

  @override
  Future<Either<Exception, TransactionEntity>> moneyWithDraw(
      {required TransactionEntity transactionEntity}) async {
    try {
      final generateId = _uuid.v1();
      await _firebaseFirestore
          .collection('Account')
          .doc(_auth.currentUser!.uid)
          .collection('Finances')
          .doc('Transaction')
          .collection('Withdraw')
          .doc(generateId)
          .set({
        'title': transactionEntity.title,
        'description': transactionEntity.description,
        'value': transactionEntity.valueMoney,
        'id': generateId,
      });
      return Right(transactionEntity);
    } catch (e) {
      return Left(Exception('Erro ao sacar dinheiro'));
    }
  }

  @override
  Future<Either<Exception, List<TransactionModel>>> getAllListDeposit() async {
    try {
      final List<TransactionModel> transactionModel = [];
      final resultWithdraw = await _firebaseFirestore
          .collection('Account')
          .doc(_auth.currentUser!.uid)
          .collection('Finances')
          .doc('Transaction')
          .collection('Withdraw')
          .get();
      for (var element in resultWithdraw.docs) {
        transactionModel.add(TransactionModel.fromMap(element.data()));
      }
      return Right(transactionModel);
    } catch (e) {
      return Left(Exception('Erro ao pegar lista de transações'));
    }
  }

  @override
  Future<Either<Exception, List<TransactionModel>>> getAllListWithDraw() async {
    try {
      final List<TransactionModel> transactionModel = [];
      final resultWithdraw = await _firebaseFirestore
          .collection('Account')
          .doc(_auth.currentUser!.uid)
          .collection('Finances')
          .doc('Transaction')
          .collection('Withdraw')
          .get();
      for (var element in resultWithdraw.docs) {
        transactionModel.add(TransactionModel.fromMap(element.data()));
      }
      return Right(transactionModel);
    } catch (e) {
      return Left(Exception('Erro ao pegar lista de transações'));
    }
  }

  @override
  Future<Either<Exception, List<TransactionModel>>> getTodo() async {
    try {
      final List<TransactionModel> transactionModel = [];
      final resultDeposit = await _firebaseFirestore
          .collection('Account')
          .doc(_auth.currentUser!.uid)
          .collection('Finances')
          .doc('Transaction')
          .collection('Deposit')
          .get();
      for (var element in resultDeposit.docs) {
        transactionModel.add(TransactionModel.fromMap(element.data()));
      }
      final resultWithdraw = await _firebaseFirestore
          .collection('Account')
          .doc(_auth.currentUser!.uid)
          .collection('Finances')
          .doc('Transaction')
          .collection('Withdraw')
          .get();
      for (var element in resultWithdraw.docs) {
        transactionModel.add(TransactionModel.fromMap(element.data()));
      }
      return Right(transactionModel);
    } catch (e) {
      return Left(Exception('Erro ao pegar lista de transações'));
    }
  }
}
