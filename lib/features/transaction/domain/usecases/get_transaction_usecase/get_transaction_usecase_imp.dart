import 'package:controle_financeiro/features/transaction/domain/usecases/get_transaction_usecase/get_transaction_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../repositories/transaction_repository.dart';
import '../../entities/transaction_entity.dart';

class GetTransactionUseCaseImp implements GetTransactionUseCase {
  final TransactionRepository _depositMoneyRepository;

  GetTransactionUseCaseImp(this._depositMoneyRepository);

  @override
  Future<Either<Exception, List<TransactionEntity>>> call() async {
    return await _depositMoneyRepository.getTodo();
  }
}
