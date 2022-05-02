import 'package:dartz/dartz.dart';
import '../../entities/transaction_entity.dart';

abstract class WithDrawMoneyUseCase {
  Future<Either<Exception, TransactionEntity>> call({required TransactionEntity moneyTransactionEntity});
}
