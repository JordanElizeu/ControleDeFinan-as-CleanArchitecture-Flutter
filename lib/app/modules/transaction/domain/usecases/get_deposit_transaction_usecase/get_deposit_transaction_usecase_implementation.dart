import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class GetDepositTransactionUseCaseImplementation implements GetDepositTransactionUseCase {
  final TransactionRepository _transactionRepository;

  GetDepositTransactionUseCaseImplementation(this._transactionRepository);

  @override
  Future<Either<Exception, List<TransactionEntity>>> call() {
    return _transactionRepository.getAllListDeposit();
  }
}
