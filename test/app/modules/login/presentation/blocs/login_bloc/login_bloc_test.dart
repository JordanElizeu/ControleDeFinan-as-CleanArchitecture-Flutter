import 'package:bloc_test/bloc_test.dart';
import 'package:controle_financeiro/app/modules/login/domain/failures/authentication_failure.dart';
import 'package:controle_financeiro/app/modules/login/domain/repositories/login_repository.dart';
import 'package:controle_financeiro/app/modules/login/domain/usecases/sign_in_google_usecase/sign_in_google_usecase_implementation.dart';
import 'package:controle_financeiro/app/modules/login/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SignInGoogleUseCaseImplementationMock extends Mock
    implements SignInGoogleUseCaseImplementation {}

class LoginRepositoryMock extends Mock implements LoginRepository {}

class UserFake extends Fake implements User {}

main() {
  final loginRepositoryMock = LoginRepositoryMock();
  final signInGoogleUseCaseImplementation =
      SignInGoogleUseCaseImplementation(loginRepositoryMock);
  late LoginBloc loginBloc;
  setUp(() {
    loginBloc = LoginBloc(signInGoogleUseCaseImplementation);
  });

  test('should return LoginStarting initial state', () {
    expect(loginBloc.state, isA<LoginStarting>());
  });

  blocTest(
    'should return LoginError',
    build: () => loginBloc,
    act: (bloc) => loginBloc.add(LoginSignInWithGoogleEvent()),
    expect: () => [
      isA<LoginError>(),
      isA<LoginStarting>(),
    ],
    setUp: () {
      when(() => loginRepositoryMock.signInGoogle()).thenAnswer(
          (invocation) async =>
              Left(AccountExistsWithDifferentCredentialFailure()));
    },
  );
  blocTest(
    'should return LoginError',
    build: () => loginBloc,
    act: (bloc) => loginBloc.add(LoginSignInWithGoogleEvent()),
    expect: () => [
      isA<LoginError>(),
      isA<LoginStarting>(),
    ],
    setUp: () {
      when(() => loginRepositoryMock.signInGoogle())
          .thenAnswer((invocation) async => Left(InvalidCredentialFailure()));
    },
  );

  blocTest(
    'should return LoginError',
    build: () => loginBloc,
    act: (bloc) => loginBloc.add(LoginSignInWithGoogleEvent()),
    expect: () => [
      isA<LoginError>(),
      isA<LoginStarting>(),
    ],
    setUp: () {
      when(() => loginRepositoryMock.signInGoogle()).thenAnswer(
          (invocation) async => Left(InvalidVerificationCodeFailure()));
    },
  );

  blocTest(
    'should return LoginError',
    build: () => loginBloc,
    act: (bloc) => loginBloc.add(LoginSignInWithGoogleEvent()),
    expect: () => [
      isA<LoginError>(),
      isA<LoginStarting>(),
    ],
    setUp: () {
      when(() => loginRepositoryMock.signInGoogle()).thenAnswer(
          (invocation) async => Left(InvalidVerificationIdFailure()));
    },
  );

  blocTest(
    'should return LoginError',
    build: () => loginBloc,
    act: (bloc) => loginBloc.add(LoginSignInWithGoogleEvent()),
    expect: () => [
      isA<LoginError>(),
      isA<LoginStarting>(),
    ],
    setUp: () {
      when(() => loginRepositoryMock.signInGoogle())
          .thenAnswer((invocation) async => Left(OperationNotAllowedFailure()));
    },
  );
  blocTest(
    'should return LoginError',
    build: () => loginBloc,
    act: (bloc) => loginBloc.add(LoginSignInWithGoogleEvent()),
    expect: () => [
      isA<LoginError>(),
      isA<LoginStarting>(),
    ],
    setUp: () {
      when(() => loginRepositoryMock.signInGoogle())
          .thenAnswer((invocation) async => Left(UserDisabledFailure()));
    },
  );
  blocTest(
    'should return LoginError',
    build: () => loginBloc,
    act: (bloc) => loginBloc.add(LoginSignInWithGoogleEvent()),
    expect: () => [
      isA<LoginError>(),
      isA<LoginStarting>(),
    ],
    setUp: () {
      when(() => loginRepositoryMock.signInGoogle())
          .thenAnswer((invocation) async => Left(UserNotFoundFailure()));
    },
  );
  blocTest(
    'should return LoginError',
    build: () => loginBloc,
    act: (bloc) => loginBloc.add(LoginSignInWithGoogleEvent()),
    expect: () => [
      isA<LoginError>(),
      isA<LoginStarting>(),
    ],
    setUp: () {
      when(() => loginRepositoryMock.signInGoogle())
          .thenAnswer((invocation) async => Left(WrongPasswordFailure()));
    },
  );

  blocTest(
    'should return LoginSuccess',
    build: () => loginBloc,
    act: (bloc) => loginBloc.add(LoginSignInWithGoogleEvent()),
    expect: () => [
      isA<LoginSuccess>(),
    ],
    setUp: () {
      when(() => loginRepositoryMock.signInGoogle())
          .thenAnswer((invocation) async => Right(UserFake()));
    },
  );
}
