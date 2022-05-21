import 'package:controle_financeiro/app/modules/transaction/domain/entities/transaction_entity.dart';
import 'package:controle_financeiro/app/modules/transaction/domain/repositories/transaction_repository.dart';
import 'package:controle_financeiro/app/modules/transaction/domain/usecases/deposit_money_usecase/deposit_money_usecase_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MoneyTransactionRepositoryMock extends Mock
    implements TransactionRepository {}

void main() {
  late final MoneyTransactionRepositoryMock moneyTransactionRepositoryMock;
  late final DepositMoneyUseCaseImp depositUseCase;
  setUpAll(() {
    moneyTransactionRepositoryMock = MoneyTransactionRepositoryMock();
    depositUseCase = DepositMoneyUseCaseImp(moneyTransactionRepositoryMock);
  });

  test('should return exception because value money is <= 0', () async {
    final depositMoney = TransactionEntity(
        valueMoney: 0, title: 'transaction', description: 'account');
    late final Exception exception;
    final result =
        await depositUseCase.call(moneyTransactionEntity: depositMoney);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test(
      'should return true because title, description is not empty and value money is > 0',
      () async {
    final depositMoney = TransactionEntity(
        valueMoney: 1, title: 'transaction', description: 'account');
    late final TransactionEntity moneyTransactionEntity;
    when(() => moneyTransactionRepositoryMock.depositMoney(
            transactionEntity: depositMoney))
        .thenAnswer((_) async => Right(depositMoney));
    final result =
        await depositUseCase.call(moneyTransactionEntity: depositMoney);
    result.fold((error) => null, (success) => moneyTransactionEntity = success);
    expect(moneyTransactionEntity, depositMoney);
  });

  test('should return exception because description is empty', () async {
    final depositMoney =
        TransactionEntity(valueMoney: 1, description: '', title: 'transaction');
    final result =
        await depositUseCase.call(moneyTransactionEntity: depositMoney);
    late final Exception exception;
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return exception because title is empty', () async {
    final depositMoney =
        TransactionEntity(valueMoney: 1, description: 'account', title: '');
    final result =
        await depositUseCase.call(moneyTransactionEntity: depositMoney);
    late Exception exception;
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });
}
