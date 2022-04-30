import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_financeiro/features/transaction/data/models/transaction_model.dart';
import 'package:controle_financeiro/features/transaction/domain/entities/transaction_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'money_transaction_remote_datasource.dart';

class MoneyTransactionRemoteDataSourceImp
    implements MoneyTransactionRemoteDataSource {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Account');
  final FirebaseAuth auth;

  MoneyTransactionRemoteDataSourceImp(this.auth);

  @override
  Future<Either<Exception, TransactionEntity>> moneyDeposit(
      {required TransactionEntity moneyTransactionModel}) async {
    try {
      collectionReference
          .doc(auth.currentUser!.uid)
          .collection('Finances')
          .doc('Transactions')
          .collection('Deposit')
          .add({
        'title': moneyTransactionModel.title,
        'description': moneyTransactionModel.description,
        'value': moneyTransactionModel.valueMoney,
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
      collectionReference
          .doc(auth.currentUser!.uid)
          .collection('Finances')
          .doc('Transactions')
          .collection('Withdraw')
          .add({
        'title': moneyTransactionModel.title,
        'description': moneyTransactionModel.description,
        'value': moneyTransactionModel.valueMoney,
      });
      return Right(moneyTransactionModel);
    } catch (e) {
      return Left(Exception('Erro: $e'));
    }
  }

  @override
  Future<Either<Exception, List<TransactionEntity>>> getFindByName(
      {required String title}) async {
    try {
      final List<TransactionModel> transactionModel = [];
      final resultDeposit = await collectionReference
          .doc(auth.currentUser!.uid)
          .collection('Finances')
          .doc('Transactions')
          .collection('Deposit')
          .orderBy('title')
          .orderBy(title)
          .get();
      for (var element in resultDeposit.docs) {
        transactionModel.add(TransactionModel.fromMap(element.data()));
      }
      final resultWithdraw = await collectionReference
          .doc(auth.currentUser!.uid)
          .collection('Finances')
          .doc('Transactions')
          .collection('Withdraw')
          .orderBy('title')
          .orderBy(title)
          .get();
      for (var element in resultWithdraw.docs) {
        transactionModel.add(TransactionModel.fromMap(element.data()));
      }
      return Right(transactionModel);
    } catch (e) {
      return Left(Exception('Aconteceu um erro.'));
    }
  }

  @override
  Future<Either<Exception, List<TransactionEntity>>> getTodo() async {
    try {
      final List<TransactionModel> transactionModel = [];
      final resultDeposit = await collectionReference
          .doc(auth.currentUser!.uid)
          .collection('Finances')
          .doc('Transactions')
          .collection('Deposit')
          .get();
      for (var element in resultDeposit.docs) {
        transactionModel.add(TransactionModel.fromMap(element.data()));
      }
      final resultWithdraw = await collectionReference
          .doc(auth.currentUser!.uid)
          .collection('Finances')
          .doc('Transactions')
          .collection('Withdraw')
          .get();
      for (var element in resultWithdraw.docs) {
        transactionModel.add(TransactionModel.fromMap(element.data()));
      }
      return Right(transactionModel);
    } catch (e) {
      return Left(Exception('Aconteceu um erro.'));
    }
  }
}
