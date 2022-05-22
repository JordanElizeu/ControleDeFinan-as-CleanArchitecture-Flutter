import '../../../../shared/domain/failures/failures.dart';

abstract class AuthenticationFailures implements GeneralFailure {}

class AccountExistsWithDifferentCredentialFailure
    implements AuthenticationFailures {}

class InvalidCredentialFailure implements AuthenticationFailures {}

class InvalidVerificationCodeFailure implements AuthenticationFailures {}

class InvalidVerificationIdFailure implements AuthenticationFailures {}

class OperationNotAllowedFailure implements AuthenticationFailures {}

class UserDisabledFailure implements AuthenticationFailures {}

class UserNotFoundFailure implements AuthenticationFailures {}

class WrongPasswordFailure implements AuthenticationFailures {}

class NetworkRequestFailure implements AuthenticationFailures {}
