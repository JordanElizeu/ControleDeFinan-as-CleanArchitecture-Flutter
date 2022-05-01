import 'package:controle_financeiro/features/login/domain/entities/register_account_entity.dart';
import 'package:controle_financeiro/features/login/domain/repositories/login_repository.dart';
import 'package:controle_financeiro/features/login/domain/usecases/register_account_firebase_usecase/register_account_firebase_usecase_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

main() {
  late LoginRepositoryMock loginRepositoryMock;
  late RegisterAccountUseCaseImp registerAccountUseCaseImp;
  setUp(() {
    loginRepositoryMock = LoginRepositoryMock();
    registerAccountUseCaseImp = RegisterAccountUseCaseImp(loginRepositoryMock);
  });
  test('should return exception because email is invalid', () async {
    late final Exception exception;
    final registerAccountEntity = RegisterAccountEntity(
      password: '123456',
      email: '',
      name: 'João magalhães',
    );
    final result = await registerAccountUseCaseImp.call(
        registerAccountEntity: registerAccountEntity);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return exception because password is less than 6 characters',
      () async {
    late final Exception exception;
    final registerAccountEntity = RegisterAccountEntity(
      password: '12345',
      email: 'teste@gmail.com',
      name: 'João magalhães',
    );
    final result = await registerAccountUseCaseImp.call(
        registerAccountEntity: registerAccountEntity);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return exception because name is empty', () async {
    late final Exception exception;
    final registerAccountEntity = RegisterAccountEntity(
      password: '123456',
      email: 'teste@gmail.com',
      name: '',
    );
    final result = await registerAccountUseCaseImp.call(
        registerAccountEntity: registerAccountEntity);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return registerAccountEntity because register is successful',
      () async {
    late final RegisterAccountEntity registerAccountEntityExpected;
    final registerAccountEntity = RegisterAccountEntity(
      password: '123456',
      email: 'teste@gmail.com',
      name: 'João magalhães',
    );
    when(() => loginRepositoryMock.registerAccount(
            registerAccountEntity: registerAccountEntity))
        .thenAnswer((_) async => Right(registerAccountEntity));
    final result = await registerAccountUseCaseImp.call(
        registerAccountEntity: registerAccountEntity);
    result.fold(
        (error) => null, (success) => registerAccountEntityExpected = success);
    expect(registerAccountEntityExpected, registerAccountEntity);
  });
}
