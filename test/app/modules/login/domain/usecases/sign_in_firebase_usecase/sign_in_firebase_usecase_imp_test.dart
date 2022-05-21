import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:controle_financeiro/app/modules/login/domain/repositories/repositories.dart';
import 'package:controle_financeiro/app/modules/login/domain/usecases/usecases.dart';
import 'package:controle_financeiro/app/modules/login/domain/entities/entities.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

main() {
  late LoginRepositoryMock loginRepositoryMock;
  late SignInUseCaseImplementation signInUseCaseImp;

  setUp(() {
    loginRepositoryMock = LoginRepositoryMock();
    signInUseCaseImp = SignInUseCaseImplementation(loginRepositoryMock);
  });

  test('should return exception because the password is less than 6 characters',
      () async {
    late final Exception exception;
    final signInEntity = SignInFirebaseEntity(
      password: '12345',
      email: 'teste@gmail.com',
    );
    final result = await signInUseCaseImp.call(signInEntity: signInEntity);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return exception because the email is invalid', () async {
    late final Exception exception;
    final signInEntity = SignInFirebaseEntity(
      password: '123456',
      email: 'test\$e@gmail',
    );
    final result = await signInUseCaseImp.call(signInEntity: signInEntity);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return signInEntity because the login is successfully',
      () async {
    late final SignInFirebaseEntity signInEntityExpected;
    final signInEntity = SignInFirebaseEntity(
      password: '123456',
      email: 'test@gmail.com',
    );
    when(() => loginRepositoryMock.signInFirebase(
            signInEntity: signInEntity))
        .thenAnswer((_) async => Right(signInEntity));
    final result = await signInUseCaseImp.call(signInEntity: signInEntity);
    result.fold((error) => null, (success) => signInEntityExpected = success);
    expect(signInEntityExpected, signInEntity);
  });
}
