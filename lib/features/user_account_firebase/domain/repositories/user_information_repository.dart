import 'package:dartz/dartz.dart';
import '../entities/user_information_entity.dart';

abstract class UserInformationRepository {
  Future<Either<Exception, UserInformationEntity>> getUserFirebaseInformation();
}
