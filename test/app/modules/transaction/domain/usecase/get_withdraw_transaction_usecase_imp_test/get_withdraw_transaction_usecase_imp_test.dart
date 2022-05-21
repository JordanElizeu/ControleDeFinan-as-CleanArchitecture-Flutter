import 'package:controle_financeiro/app/modules/transaction/domain/entities/transaction_entity.dart';
import 'package:controle_financeiro/app/modules/transaction/domain/repositories/transaction_repository.dart';
import 'package:controle_financeiro/app/modules/transaction/domain/usecases/get_withdraw_transaction_usecase/get_withdraw_transaction_usecase_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MoneyTransactionRepositoryMock extends Mock
    implements TransactionRepository {}

main() {
  late MoneyTransactionRepositoryMock moneyTransactionRepositoryMock;
  late GetWithDrawTransactionUseCaseImp getWithDrawTransactionUseCaseImp;
  setUp(() {
    moneyTransactionRepositoryMock = MoneyTransactionRepositoryMock();
    getWithDrawTransactionUseCaseImp =
        GetWithDrawTransactionUseCaseImp(moneyTransactionRepositoryMock);
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
