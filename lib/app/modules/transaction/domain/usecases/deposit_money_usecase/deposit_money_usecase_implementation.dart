import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class DepositMoneyUseCaseImplementation implements DepositMoneyUseCase {
  final TransactionRepository _depositMoneyRepository;

  DepositMoneyUseCaseImplementation(this._depositMoneyRepository);

  @override
  Future<Either<Exception, TransactionEntity>> call(
      {required TransactionEntity moneyTransactionEntity}) async {
    if (moneyTransactionEntity.valueMoney > 0 &&
        moneyTransactionEntity.description.isNotEmpty &&
        moneyTransactionEntity.title.isNotEmpty) {
      return await _depositMoneyRepository.depositMoney(
          transactionEntity: moneyTransactionEntity);
    }
    return Left(Exception('erro, preencha campos corretamente.'));
  }
}
