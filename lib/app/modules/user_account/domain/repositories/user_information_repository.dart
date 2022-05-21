import 'package:dartz/dartz.dart';

import '../entities/entities.dart';

abstract class UserInformationRepository {
  Future<Either<Exception, UserInformationEntity>> getUserFirebaseInformation();
}
