import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';

abstract class GetWithDrawTransactionUseCase {
  Future<Either<Exception, List<TransactionEntity>>> call();
}
