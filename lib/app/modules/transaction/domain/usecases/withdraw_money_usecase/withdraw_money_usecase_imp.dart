import 'package:dartz/dartz.dart';
import '../../repositories/transaction_repository.dart';
import '../../entities/transaction_entity.dart';
import 'withdraw_money_usecase.dart';

class WithDrawMoneyUseCaseImp implements WithDrawMoneyUseCase {
  final TransactionRepository _withDrawMoneyRepository;

  WithDrawMoneyUseCaseImp(this._withDrawMoneyRepository);

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
