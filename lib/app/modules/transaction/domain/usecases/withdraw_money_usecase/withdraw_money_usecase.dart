import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';

abstract class WithDrawMoneyUseCase {
  Future<Either<Exception, TransactionEntity>> call(
      {required TransactionEntity moneyTransactionEntity});
}
