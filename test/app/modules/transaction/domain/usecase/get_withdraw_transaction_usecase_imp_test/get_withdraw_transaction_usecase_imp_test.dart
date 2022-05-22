import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:controle_financeiro/app/modules/transaction/domain/entities/entities.dart';
import 'package:controle_financeiro/app/modules/transaction/domain/repositories/repositories.dart';
import 'package:controle_financeiro/app/modules/transaction/domain/usecases/usecases.dart';

class MoneyTransactionRepositoryMock extends Mock
    implements TransactionRepository {}

main() {
  late MoneyTransactionRepositoryMock moneyTransactionRepositoryMock;
  late GetWithDrawTransactionUseCaseImplementation getWithDrawTransactionUseCaseImp;
  setUp(() {
    moneyTransactionRepositoryMock = MoneyTransactionRepositoryMock();
    getWithDrawTransactionUseCaseImp =
        GetWithDrawTransactionUseCaseImplementation(moneyTransactionRepositoryMock);
  });

  test('should return empty list', () async {
    late final List<TransactionEntity> eitherResultSuccess;
    when(() => moneyTransactionRepositoryMock.getAllListWithDraw())
        .thenAnswer((_) async => const Right([]));
    final result = await getWithDrawTransactionUseCaseImp.call();
    result.fold((error) => null, (success) => eitherResultSuccess = success);
    expect(eitherResultSuccess, []);
  });
}
