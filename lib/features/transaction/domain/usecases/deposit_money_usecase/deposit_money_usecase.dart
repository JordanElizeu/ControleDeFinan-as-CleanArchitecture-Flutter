import 'package:dartz/dartz.dart';
import '../../entities/transaction_entity.dart';

abstract class DepositMoneyUseCase {
  Future<Either<Exception, void>> call({required TransactionEntity moneyTransactionEntity});
}
