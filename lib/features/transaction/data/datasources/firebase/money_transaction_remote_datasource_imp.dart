import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_financeiro/features/transaction/data/models/transaction_model.dart';
import 'package:controle_financeiro/features/transaction/domain/entities/transaction_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'money_transaction_remote_datasource.dart';

class MoneyTransactionRemoteDataSourceImp
    implements MoneyTransactionRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _auth;
  final Uuid _uuid;
  // = FirebaseFirestore.instance.collection('Account')
  MoneyTransactionRemoteDataSourceImp(
    this._auth,
    this._uuid,
    this._firebaseFirestore,
  );

  @override
  Future<Either<Exception, TransactionEntity>> moneyDeposit(
      {required TransactionEntity moneyTransactionModel}) async {
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
        'title': moneyTransactionModel.title,
        'description': moneyTransactionModel.description,
        'value': moneyTransactionModel.valueMoney,
        'id': generateId,
      });
      return Right(moneyTransactionModel);
    } catch (e) {
      return Left(Exception('Erro: $e'));
    }
  }

  @override
  Future<Either<Exception, TransactionEntity>> moneyWithDraw(
      {required TransactionEntity moneyTransactionModel}) async {
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
        'title': moneyTransactionModel.title,
        'description': moneyTransactionModel.description,
        'value': moneyTransactionModel.valueMoney,
        'id': generateId,
      });
      return Right(moneyTransactionModel);
    } catch (e) {
      return Left(Exception('Erro ao sacar dinheiro'));
    }
  }

  @override
  Future<Either<Exception, List<TransactionEntity>>> getAllListDeposit() async {
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
  Future<Either<Exception, List<TransactionEntity>>>
      getAllListWithDraw() async {
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
  Future<Either<Exception, List<TransactionEntity>>> getTodo() async {
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
