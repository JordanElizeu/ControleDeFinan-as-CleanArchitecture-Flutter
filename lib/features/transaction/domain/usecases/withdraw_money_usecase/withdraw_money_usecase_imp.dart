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
      late final Either<Exception, TransactionEntity> resultOperation;
      final eitherResult = await _withDrawMoneyRepository.withDrawMoney(
          moneyTransactionEntity: moneyTransactionEntity);
      eitherResult.fold(
        (error) => resultOperation = Left(error),
        (success) => resultOperation = Right(success),
      );
      return resultOperation;
    }
    return Left(Exception('erro, preencha os campos corretamente.'));
  }
}
