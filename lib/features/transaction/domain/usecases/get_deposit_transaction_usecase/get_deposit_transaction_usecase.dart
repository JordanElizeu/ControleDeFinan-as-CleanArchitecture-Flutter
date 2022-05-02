import 'package:dartz/dartz.dart';
import '../../entities/transaction_entity.dart';

abstract class GetDepositTransactionUseCase {
  Future<Either<Exception, List<TransactionEntity>>> call();
}
