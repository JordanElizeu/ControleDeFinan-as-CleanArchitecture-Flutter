import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:controle_financeiro/app/modules/login/domain/failures/failures.dart';
import 'package:controle_financeiro/app/modules/login/infrastructure/datasources/datasources.dart';
import 'package:controle_financeiro/app/modules/login/infrastructure/repositories/repositories.dart';
import 'package:controle_financeiro/app/shared/domain/failures/failures.dart';

class SignInGoogleDatasourceMock extends Mock
    implements SignInGoogleDatasource {}

class UserFake extends Fake implements User {}

final signInGoogleDatasourceMock = SignInGoogleDatasourceMock();
final loginRepositoryImplementation =
    LoginRepositoryImplementation(signInGoogleDatasourceMock);

main() {
  setUpAll(() {
    registerFallbackValue(UserFake());
  });

  test('should return user', () async {
    when(() => signInGoogleDatasourceMock.signInGoogle())
        .thenAnswer((invocation) async => UserFake());
    final result = await loginRepositoryImplementation.signInGoogle();
    expect(result.fold(id, id), isA<User>());
  });

  test('should return AccountExistsWithDifferentCredentialFailure', () async {
    when(() => signInGoogleDatasourceMock.signInGoogle()).thenThrow(
        FirebaseAuthException(
            code: 'account-exists-with-different-credential'));
    final result = await loginRepositoryImplementation.signInGoogle();
    expect(result.fold(id, id),
        isA<AccountExistsWithDifferentCredentialFailure>());
  });

  test('should return InvalidCredentialFailure', () async {
    when(() => signInGoogleDatasourceMock.signInGoogle())
        .thenThrow(FirebaseAuthException(code: 'invalid-credential'));
    final result = await loginRepositoryImplementation.signInGoogle();
    expect(result.fold(id, id), isA<InvalidCredentialFailure>());
  });

  test('should return OperationNotAllowedFailure', () async {
    when(() => signInGoogleDatasourceMock.signInGoogle())
        .thenThrow(FirebaseAuthException(code: 'operation-not-allowed'));
    final result = await loginRepositoryImplementation.signInGoogle();
    expect(result.fold(id, id), isA<OperationNotAllowedFailure>());
  });

  test('should return UserDisabledFailure', () async {
    when(() => signInGoogleDatasourceMock.signInGoogle())
        .thenThrow(FirebaseAuthException(code: 'user-disabled'));
    final result = await loginRepositoryImplementation.signInGoogle();
    expect(result.fold(id, id), isA<UserDisabledFailure>());
  });

  test('should return AccountExistsWithDifferentCredentialFailure', () async {
    when(() => signInGoogleDatasourceMock.signInGoogle())
        .thenThrow(FirebaseAuthException(code: 'user-not-found'));
    final result = await loginRepositoryImplementation.signInGoogle();
    expect(result.fold(id, id), isA<UserNotFoundFailure>());
  });

  test('should return WrongPasswordFailure', () async {
    when(() => signInGoogleDatasourceMock.signInGoogle())
        .thenThrow(FirebaseAuthException(code: 'wrong-password'));
    final result = await loginRepositoryImplementation.signInGoogle();
    expect(result.fold(id, id), isA<WrongPasswordFailure>());
  });

  test('should return InvalidVerificationCodeFailure', () async {
    when(() => signInGoogleDatasourceMock.signInGoogle())
        .thenThrow(FirebaseAuthException(code: 'invalid-verification-code'));
    final result = await loginRepositoryImplementation.signInGoogle();
    expect(result.fold(id, id), isA<InvalidVerificationCodeFailure>());
  });

  test('should return InvalidVerificationIdFailure', () async {
    when(() => signInGoogleDatasourceMock.signInGoogle())
        .thenThrow(FirebaseAuthException(code: 'invalid-verification-id'));
    final result = await loginRepositoryImplementation.signInGoogle();
    expect(result.fold(id, id), isA<InvalidVerificationIdFailure>());
  });

  test('should return NetworkRequestFailure', () async {
    when(() => signInGoogleDatasourceMock.signInGoogle())
        .thenThrow(FirebaseAuthException(code: 'network-request-failed'));
    final result = await loginRepositoryImplementation.signInGoogle();
    expect(result.fold(id, id), isA<NetworkRequestFailure>());
  });

  test('should return GenericFailure', () async {
    when(() => signInGoogleDatasourceMock.signInGoogle())
        .thenThrow(Exception());
    final result = await loginRepositoryImplementation.signInGoogle();
    expect(result.fold(id, id), isA<GenericFailure>());
  });
}
