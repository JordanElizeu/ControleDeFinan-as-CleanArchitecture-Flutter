import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:controle_financeiro/app/modules/login/domain/repositories/repositories.dart';
import 'package:controle_financeiro/app/modules/login/domain/usecases/usecases.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

main() {
  late LoginRepositoryMock loginRepositoryMock;
  late ForgotPasswordWithFirebaseUseCaseImplementation
      forgotPasswordWithFirebaseUseCaseImp;
  setUp(() {
    loginRepositoryMock = LoginRepositoryMock();
    forgotPasswordWithFirebaseUseCaseImp =
        ForgotPasswordWithFirebaseUseCaseImplementation(loginRepositoryMock);
  });

  test('should return exception because email is empty', () async {
    late final Exception exception;
    final result = await forgotPasswordWithFirebaseUseCaseImp.call(email: '');
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return exception because email is invalid', () async {
    late final Exception exception;
    final result =
        await forgotPasswordWithFirebaseUseCaseImp.call(email: 'test@gmail');
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return true', () async {
    const email = 'test@gmail.com';
    when(() => loginRepositoryMock.forgotPasswordWithFirebase(email: email))
        .thenAnswer((_) async => const Right(null));
    final result =
        await forgotPasswordWithFirebaseUseCaseImp.call(email: email);
    expect(result.isRight(), true);
  });
}
