import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:controle_financeiro/app/modules/transaction/domain/entities/entities.dart';
import 'package:controle_financeiro/app/modules/transaction/domain/repositories/repositories.dart';
import 'package:controle_financeiro/app/modules/transaction/domain/usecases/usecases.dart';

class MoneyTransactionRepositoryMock extends Mock
    implements TransactionRepository {}

void main() {
  late final MoneyTransactionRepositoryMock moneyTransactionRepositoryMock;
  late final DepositMoneyUseCaseImplementation depositUseCase;
  setUpAll(() {
    moneyTransactionRepositoryMock = MoneyTransactionRepositoryMock();
    depositUseCase = DepositMoneyUseCaseImplementation(moneyTransactionRepositoryMock);
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
