import 'package:controle_financeiro/app/modules/transaction/domain/entities/transaction_entity.dart';
import 'package:controle_financeiro/app/modules/transaction/domain/repositories/transaction_repository.dart';
import 'package:controle_financeiro/app/modules/transaction/domain/usecases/get_deposit_transaction_usecase/get_deposit_transaction_usecase_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MoneyTransactionRepositoryMock extends Mock
    implements TransactionRepository {}

main() {
  late MoneyTransactionRepositoryMock moneyTransactionRepositoryMock;
  late GetDepositTransactionUseCaseImplementation getTransactionUseCaseImp;
  setUp(() {
    moneyTransactionRepositoryMock = MoneyTransactionRepositoryMock();
    getTransactionUseCaseImp =
        GetDepositTransactionUseCaseImplementation(moneyTransactionRepositoryMock);
  });

  test('should return empty list', () async {
    late final List<TransactionEntity> eitherResultSuccess;
    when(() => moneyTransactionRepositoryMock.getAllListDeposit())
        .thenAnswer((_) async => const Right([]));
    final result = await getTransactionUseCaseImp.call();
    result.fold((error) => null, (success) => eitherResultSuccess = success);
    expect(eitherResultSuccess, []);
  });
}
