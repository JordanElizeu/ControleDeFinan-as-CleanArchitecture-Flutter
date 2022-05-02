import 'package:controle_financeiro/layers/transaction/domain/entities/transaction_entity.dart';
import 'package:controle_financeiro/layers/transaction/domain/repositories/transaction_repository.dart';
import 'package:controle_financeiro/layers/transaction/domain/usecases/get_transaction_usecase/get_transaction_usecase_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MoneyTransactionRepositoryMock extends Mock
    implements TransactionRepository {}

main() {
  late MoneyTransactionRepositoryMock moneyTransactionRepositoryMock;
  late GetTransactionUseCaseImp getTransactionUseCaseImp;
  setUp(() {
    moneyTransactionRepositoryMock = MoneyTransactionRepositoryMock();
    getTransactionUseCaseImp =
        GetTransactionUseCaseImp(moneyTransactionRepositoryMock);
  });

  test('should return empty list', () async {
    late final List<TransactionEntity> eitherResultSuccess;
    when(() => moneyTransactionRepositoryMock.getTodo())
        .thenAnswer((_) async => const Right([]));
    final result = await getTransactionUseCaseImp.call();
    result.fold((error) => null, (success) => eitherResultSuccess = success);
    expect(eitherResultSuccess, []);
  });
}
