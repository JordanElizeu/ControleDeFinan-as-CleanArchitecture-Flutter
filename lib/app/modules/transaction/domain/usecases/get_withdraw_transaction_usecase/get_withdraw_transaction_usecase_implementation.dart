import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class GetWithDrawTransactionUseCaseImplementation
    implements GetWithDrawTransactionUseCase {
  final TransactionRepository _transactionRepository;

  GetWithDrawTransactionUseCaseImplementation(this._transactionRepository);

  @override
  Future<Either<Exception, List<TransactionEntity>>> call() {
    return _transactionRepository.getAllListWithDraw();
  }
}
