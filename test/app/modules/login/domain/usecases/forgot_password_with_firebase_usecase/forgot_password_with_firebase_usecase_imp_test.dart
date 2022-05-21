import 'package:controle_financeiro/app/modules/login/domain/repositories/login_repository.dart';
import 'package:controle_financeiro/app/modules/login/domain/usecases/forgot_password_with_firebase_usecase/forgot_password_with_firebase_usecase_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

main() {
  late LoginRepositoryMock loginRepositoryMock;
  late ForgotPasswordWithFirebaseUseCaseImp
      forgotPasswordWithFirebaseUseCaseImp;
  setUp(() {
    loginRepositoryMock = LoginRepositoryMock();
    forgotPasswordWithFirebaseUseCaseImp =
        ForgotPasswordWithFirebaseUseCaseImp(loginRepositoryMock);
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
