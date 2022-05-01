import 'package:controle_financeiro/features/transaction/domain/entities/transaction_entity.dart';
import 'package:controle_financeiro/features/transaction/domain/repositories/transaction_repository.dart';
import 'package:controle_financeiro/features/transaction/domain/usecases/withdraw_money_usecase/withdraw_money_usecase_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MoneyTransactionRepositoryMock extends Mock
    implements TransactionRepository {}

void main() {
  late final MoneyTransactionRepositoryMock moneyTransactionRepositoryMock;
  late final WithDrawMoneyUseCaseImp withDrawMoneyUseCaseImp;
  setUpAll(() {
    moneyTransactionRepositoryMock = MoneyTransactionRepositoryMock();
    withDrawMoneyUseCaseImp =
        WithDrawMoneyUseCaseImp(moneyTransactionRepositoryMock);
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
            moneyTransactionEntity: withDrawMoney))
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
