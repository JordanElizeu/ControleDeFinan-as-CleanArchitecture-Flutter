import 'package:dartz/dartz.dart';

import '../../entities/transaction_entity.dart';
import '../../repositories/transaction_repository.dart';
import 'deposit_money_usecase.dart';

class DepositMoneyUseCaseImp implements DepositMoneyUseCase {
  final TransactionRepository _depositMoneyRepository;

  DepositMoneyUseCaseImp(this._depositMoneyRepository);

  @override
  Future<Either<Exception, TransactionEntity>> call(
      {required TransactionEntity moneyTransactionEntity}) async {
    if (moneyTransactionEntity.valueMoney > 0 &&
        moneyTransactionEntity.description.isNotEmpty &&
        moneyTransactionEntity.title.isNotEmpty) {
      return await _depositMoneyRepository.depositMoney(
          moneyTransactionEntity: moneyTransactionEntity);
    }
    return Left(Exception('erro, preencha campos corretamente.'));
  }
}
