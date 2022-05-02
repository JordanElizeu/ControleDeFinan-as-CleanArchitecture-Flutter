import 'package:dartz/dartz.dart';
import '../../entities/transaction_entity.dart';

abstract class GetWithDrawTransactionUseCase {
  Future<Either<Exception, List<TransactionEntity>>> call();
}
