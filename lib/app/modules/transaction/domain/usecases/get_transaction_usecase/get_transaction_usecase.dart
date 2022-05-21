import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';

abstract class GetTransactionUseCase {
  Future<Either<Exception, List<TransactionEntity>>> call();
}
