import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class GetTransactionUseCaseImplementation implements GetTransactionUseCase {
  final TransactionRepository _depositMoneyRepository;

  GetTransactionUseCaseImplementation(this._depositMoneyRepository);

  @override
  Future<Either<Exception, List<TransactionEntity>>> call() async {
    return await _depositMoneyRepository.getTodo();
  }
}
