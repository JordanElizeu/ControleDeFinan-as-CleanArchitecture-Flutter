import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class WithDrawMoneyUseCaseImplementation implements WithDrawMoneyUseCase {
  final TransactionRepository _withDrawMoneyRepository;

  WithDrawMoneyUseCaseImplementation(this._withDrawMoneyRepository);

  @override
  Future<Either<Exception, TransactionEntity>> call(
      {required TransactionEntity moneyTransactionEntity}) async {
    if (moneyTransactionEntity.valueMoney > 0 &&
        moneyTransactionEntity.description.isNotEmpty &&
        moneyTransactionEntity.title.isNotEmpty) {
      return await _withDrawMoneyRepository.withDrawMoney(
          transactionEntity: moneyTransactionEntity);
    }
    return Left(Exception('erro, preencha os campos corretamente.'));
  }
}
