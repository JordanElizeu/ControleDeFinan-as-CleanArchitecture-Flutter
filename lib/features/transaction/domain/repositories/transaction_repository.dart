import 'package:dartz/dartz.dart';
import '../entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Either<Exception, TransactionEntity>> depositMoney(
      {required TransactionEntity moneyTransactionEntity});
  Future<Either<Exception, TransactionEntity>> withDrawMoney(
      {required TransactionEntity moneyTransactionEntity});
  Future<Either<Exception, List<TransactionEntity>>> getTodo();
}
