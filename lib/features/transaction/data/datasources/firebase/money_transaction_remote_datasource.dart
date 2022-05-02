import 'package:dartz/dartz.dart';
import '../../../domain/entities/transaction_entity.dart';

abstract class MoneyTransactionRemoteDataSource {
  Future<Either<Exception, TransactionEntity>> moneyDeposit(
      {required TransactionEntity moneyTransactionModel});
  Future<Either<Exception, TransactionEntity>> moneyWithDraw(
      {required TransactionEntity moneyTransactionModel});
  Future<Either<Exception, List<TransactionEntity>>> getTodo();
  Future<Either<Exception, List<TransactionEntity>>> getAllListWithDraw();
  Future<Either<Exception, List<TransactionEntity>>> getAllListDeposit();
}
