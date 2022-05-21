import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';

abstract class DepositMoneyUseCase {
  Future<Either<Exception, void>> call({required TransactionEntity moneyTransactionEntity});
}
