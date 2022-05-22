import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';

abstract class MoneyTransactionRemoteDataSource {
  Future<Either<Exception, TransactionEntity>> moneyDeposit(
      {required TransactionEntity transactionEntity});
  Future<Either<Exception, TransactionEntity>> moneyWithDraw(
      {required TransactionEntity transactionEntity});
  Future<Either<Exception, List<TransactionEntity>>> getTodo();
  Future<Either<Exception, List<TransactionEntity>>> getAllListWithDraw();
  Future<Either<Exception, List<TransactionEntity>>> getAllListDeposit();
}
