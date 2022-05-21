import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';

abstract class GetUserInformationUseCase {
  Future<Either<Exception, UserInformationEntity>> call();
}
