import 'package:controle_financeiro/layers/transaction/domain/entities/transaction_entity.dart';
import 'package:controle_financeiro/layers/transaction/domain/repositories/transaction_repository.dart';
import 'package:dartz/dartz.dart';
import 'get_withdraw_transaction_usecase.dart';

class GetWithDrawTransactionUseCaseImp
    implements GetWithDrawTransactionUseCase {
  final TransactionRepository _transactionRepository;

  GetWithDrawTransactionUseCaseImp(this._transactionRepository);

  @override
  Future<Either<Exception, List<TransactionEntity>>> call() {
    return _transactionRepository.getAllListWithDraw();
  }
}
