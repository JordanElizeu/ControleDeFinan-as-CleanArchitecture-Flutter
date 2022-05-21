import 'package:dartz/dartz.dart';
import '../../entities/transaction_entity.dart';
import '../../repositories/transaction_repository.dart';
import 'get_deposit_transaction_usecase.dart';

class GetDepositTransactionUseCaseImp implements GetDepositTransactionUseCase {
  final TransactionRepository _transactionRepository;

  GetDepositTransactionUseCaseImp(this._transactionRepository);

  @override
  Future<Either<Exception, List<TransactionEntity>>> call() {
    return _transactionRepository.getAllListDeposit();
  }
}
