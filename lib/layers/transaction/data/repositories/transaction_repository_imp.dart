import 'package:dartz/dartz.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/firebase/money_transaction_remote_datasource.dart';

class TransactionRepositoryImp implements TransactionRepository {
  final MoneyTransactionRemoteDataSource _moneyTransactionRemoteDataSource;

  TransactionRepositoryImp(this._moneyTransactionRemoteDataSource);

  @override
  Future<Either<Exception, TransactionEntity>> depositMoney(
      {required TransactionEntity transactionEntity}) async {
    return await _moneyTransactionRemoteDataSource.moneyDeposit(
        transactionEntity: transactionEntity);
  }

  @override
  Future<Either<Exception, TransactionEntity>> withDrawMoney(
      {required TransactionEntity transactionEntity}) async {
    return await _moneyTransactionRemoteDataSource.moneyWithDraw(
        transactionEntity: transactionEntity);
  }

  @override
  Future<Either<Exception, List<TransactionEntity>>> getTodo() {
    return _moneyTransactionRemoteDataSource.getTodo();
  }

  @override
  Future<Either<Exception, List<TransactionEntity>>> getAllListDeposit() {
    return _moneyTransactionRemoteDataSource.getAllListDeposit();
  }

  @override
  Future<Either<Exception, List<TransactionEntity>>> getAllListWithDraw() {
    return _moneyTransactionRemoteDataSource.getAllListWithDraw();
  }
}
