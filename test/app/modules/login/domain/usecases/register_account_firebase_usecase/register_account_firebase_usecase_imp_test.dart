import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:controle_financeiro/app/modules/login/domain/repositories/repositories.dart';
import 'package:controle_financeiro/app/modules/login/domain/usecases/usecases.dart';
import 'package:controle_financeiro/app/modules/login/domain/entities/entities.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

main() {
  late LoginRepositoryMock loginRepositoryMock;
  late RegisterAccountUseCaseImplementation registerAccountUseCaseImp;
  setUp(() {
    loginRepositoryMock = LoginRepositoryMock();
    registerAccountUseCaseImp = RegisterAccountUseCaseImplementation(loginRepositoryMock);
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
