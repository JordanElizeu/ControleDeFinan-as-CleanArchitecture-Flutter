import 'package:dartz/dartz.dart';
import '../entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Either<Exception, TransactionEntity>> depositMoney(
      {required TransactionEntity transactionEntity});
  Future<Either<Exception, TransactionEntity>> withDrawMoney(
      {required TransactionEntity transactionEntity});
  Future<Either<Exception, List<TransactionEntity>>> getTodo();
  Future<Either<Exception, List<TransactionEntity>>> getAllListWithDraw();
  Future<Either<Exception, List<TransactionEntity>>> getAllListDeposit();
}
