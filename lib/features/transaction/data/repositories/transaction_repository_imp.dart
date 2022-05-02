import 'package:dartz/dartz.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/firebase/money_transaction_remote_datasource.dart';

class TransactionRepositoryImp implements TransactionRepository {
  final MoneyTransactionRemoteDataSource _moneyTransactionRemoteDataSource;

  TransactionRepositoryImp(this._moneyTransactionRemoteDataSource);

  @override
  Future<Either<Exception, TransactionEntity>> withDrawMoney(
      {required TransactionEntity moneyTransactionEntity}) async {
    late final Either<Exception, TransactionEntity> operationResult;
    var eitherResult = await _moneyTransactionRemoteDataSource.moneyWithDraw(
        moneyTransactionModel: moneyTransactionEntity);
    eitherResult.fold(
      (error) => operationResult = Left(error),
      (success) => operationResult = Right(success),
    );
    return operationResult;
  }

  @override
  Future<Either<Exception, TransactionEntity>> depositMoney(
      {required TransactionEntity moneyTransactionEntity}) async {
    late final Either<Exception, TransactionEntity> operationResult;
    var eitherResult = await _moneyTransactionRemoteDataSource.moneyDeposit(
        moneyTransactionModel: moneyTransactionEntity);
    eitherResult.fold(
      (error) => operationResult = Left(error),
      (success) => operationResult = Right(success),
    );
    return operationResult;
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
