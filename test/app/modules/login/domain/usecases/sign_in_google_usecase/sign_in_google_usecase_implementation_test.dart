import 'package:controle_financeiro/app/modules/login/domain/failures/authentication_failure.dart';
import 'package:controle_financeiro/app/modules/login/domain/repositories/login_repository.dart';
import 'package:controle_financeiro/app/modules/login/domain/usecases/sign_in_google_usecase/sign_in_google_usecase_implementation.dart';
import 'package:controle_financeiro/app/shared/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

class UserFake extends Fake implements User {}

final signInGoogleRepositoryMock = LoginRepositoryMock();
final signInGoogleImplementation =
    SignInGoogleUseCaseImplementation(signInGoogleRepositoryMock);

main() {
  setUpAll(() {
    registerFallbackValue(UserFake());
  });

  test('should return user', () async {
    when(() => signInGoogleRepositoryMock.signInGoogle())
        .thenAnswer((invocation) async => Right(UserFake()));
    final result = await signInGoogleImplementation.call();
    expect(result.fold(id, id), isA<User>());
  });

  test('should return AccountExistsWithDifferentCredentialFailure', () async {
    when(() => signInGoogleRepositoryMock.signInGoogle()).thenAnswer(
        (invocation) async =>
            Left(AccountExistsWithDifferentCredentialFailure()));
    final result = await signInGoogleImplementation.call();
    expect(result.fold(id, id),
        isA<AccountExistsWithDifferentCredentialFailure>());
  });

  test('should return InvalidCredentialFailure', () async {
    when(() => signInGoogleRepositoryMock.signInGoogle())
        .thenAnswer((invocation) async => Left(InvalidCredentialFailure()));
    final result = await signInGoogleImplementation.call();
    expect(result.fold(id, id), isA<InvalidCredentialFailure>());
  });

  test('should return OperationNotAllowedFailure', () async {
    when(() => signInGoogleRepositoryMock.signInGoogle())
        .thenAnswer((invocation) async => Left(OperationNotAllowedFailure()));
    final result = await signInGoogleImplementation.call();
    expect(result.fold(id, id), isA<OperationNotAllowedFailure>());
  });

  test('should return UserDisabledFailure', () async {
    when(() => signInGoogleRepositoryMock.signInGoogle())
        .thenAnswer((invocation) async => Left(UserDisabledFailure()));
    final result = await signInGoogleImplementation.call();
    expect(result.fold(id, id), isA<UserDisabledFailure>());
  });

  test('should return UserNotFoundFailure', () async {
    when(() => signInGoogleRepositoryMock.signInGoogle()).thenAnswer(
        (invocation) async =>
            Left(UserNotFoundFailure()));
    final result = await signInGoogleImplementation.call();
    expect(result.fold(id, id), isA<UserNotFoundFailure>());
  });

  test('should return WrongPasswordFailure', () async {
    when(() => signInGoogleRepositoryMock.signInGoogle())
        .thenAnswer((invocation) async => Left(WrongPasswordFailure()));
    final result = await signInGoogleImplementation.call();
    expect(result.fold(id, id), isA<WrongPasswordFailure>());
  });

  test('should return InvalidVerificationCodeFailure', () async {
    when(() => signInGoogleRepositoryMock.signInGoogle()).thenAnswer(
        (invocation) async => Left(InvalidVerificationCodeFailure()));
    final result = await signInGoogleImplementation.call();
    expect(result.fold(id, id), isA<InvalidVerificationCodeFailure>());
  });

  test('should return InvalidVerificationIdFailure', () async {
    when(() => signInGoogleRepositoryMock.signInGoogle())
        .thenAnswer((invocation) async => Left(InvalidVerificationIdFailure()));
    final result = await signInGoogleImplementation.call();
    expect(result.fold(id, id), isA<InvalidVerificationIdFailure>());
  });

  test('should return NetworkRequestFailure', () async {
    when(() => signInGoogleRepositoryMock.signInGoogle())
        .thenAnswer((invocation) async => Left(NetworkRequestFailure()));
    final result = await signInGoogleImplementation.call();
    expect(result.fold(id, id), isA<NetworkRequestFailure>());
  });

  test('should return GenericFailure', () async {
    when(() => signInGoogleRepositoryMock.signInGoogle())
        .thenAnswer((invocation) async => Left(GenericFailure()));
    final result = await signInGoogleImplementation.call();
    expect(result.fold(id, id), isA<GenericFailure>());
  });
}
