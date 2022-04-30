import 'package:controle_financeiro/features/login/domain/entities/sign_in_entity.dart';
import 'package:controle_financeiro/features/login/domain/usecases/sign_in_usecase/sign_in_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late SignInUseCaseImp signInUseCaseImp;

  setUp(() {
    signInUseCaseImp = SignInUseCaseImp();
  });

  test('should return exception because the password is less than 6 characters', () async {
    late final Exception exception;
    final signInEntity = SignInEntity(
      password: '12345',
      email: 'teste@gmail.com',
    );
    final result = await signInUseCaseImp.signIn(signInEntity: signInEntity);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return exception because the email is invalid', () async {
    late final Exception exception;
    final signInEntity = SignInEntity(
      password: '123456',
      email: 'test\$e@gmail',
    );
    final result = await signInUseCaseImp.signIn(signInEntity: signInEntity);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return signInEntity because the login is successfully', () async {
    late final SignInEntity signInEntityExpected;
    final signInEntity = SignInEntity(
      password: '123456',
      email: 'test@gmail.com',
    );
    final result = await signInUseCaseImp.signIn(signInEntity: signInEntity);
    result.fold((error) => null, (success) => signInEntityExpected = success);
    expect(signInEntityExpected, signInEntity);
  });
}
