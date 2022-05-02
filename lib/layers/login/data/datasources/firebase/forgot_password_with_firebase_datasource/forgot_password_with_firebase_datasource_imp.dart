import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../../core/exceptions/firebase_exception/firebase_send_password_reset_email_exception.dart';
import 'forgot_password_with_firebase_datasource.dart';

class ForgotPasswordWithFirebaseDataSourceImp
    implements ForgotPasswordWithFirebaseDataSource {
  final FirebaseAuth _firebaseAuth;

  ForgotPasswordWithFirebaseDataSourceImp(this._firebaseAuth);

  @override
  Future<Either<Exception, bool>> call({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right(true);
    } on FirebaseAuthException catch (exception) {
      return Left(Exception(FirebaseSendPasswordResetEmailException
          .handleFirebaseSendPasswordResetEmailException(
        exceptionMessage: exception,
      )));
    }
  }
}
