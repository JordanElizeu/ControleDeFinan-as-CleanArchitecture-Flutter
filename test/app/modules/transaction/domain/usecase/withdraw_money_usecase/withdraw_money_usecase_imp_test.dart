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
  late final WithDrawMoneyUseCaseImplementation withDrawMoneyUseCaseImp;
  setUpAll(() {
    moneyTransactionRepositoryMock = MoneyTransactionRepositoryMock();
    withDrawMoneyUseCaseImp =
        WithDrawMoneyUseCaseImplementation(moneyTransactionRepositoryMock);
  });

  test('should return false because value money is <= 0', () async {
    final withDrawMoney = TransactionEntity(
        valueMoney: 0, description: 'account', title: 'transaction');
    late final Exception exception;
    final result = await withDrawMoneyUseCaseImp.call(
        moneyTransactionEntity: withDrawMoney);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test(
      'should return true because value money is > 0 description and title is not empty',
      () async {
    final withDrawMoney = TransactionEntity(
        valueMoney: 1, description: 'account', title: 'transaction');
    when(() => moneyTransactionRepositoryMock.withDrawMoney(
        transactionEntity: withDrawMoney))
        .thenAnswer((_) async => Right(withDrawMoney));
    final result = await withDrawMoneyUseCaseImp.call(
        moneyTransactionEntity: withDrawMoney);
    late final TransactionEntity moneyTransactionEntity;
    result.fold((error) => null, (success) => moneyTransactionEntity = success);
    expect(moneyTransactionEntity, withDrawMoney);
  });

  test('should return false because description is empty', () async {
    final withDrawMoney = TransactionEntity(
        valueMoney: 1, description: '', title: 'transaction');
    final result = await withDrawMoneyUseCaseImp.call(
        moneyTransactionEntity: withDrawMoney);
    late final Exception exception;
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return false because title is empty', () async {
    final withDrawMoney = TransactionEntity(
        valueMoney: 1, description: 'account', title: '');
    final result = await withDrawMoneyUseCaseImp.call(
        moneyTransactionEntity: withDrawMoney);
    late final Exception exception;
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });
}
