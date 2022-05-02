import 'package:dartz/dartz.dart';
import '../../entities/user_information_entity.dart';

abstract class GetUserInformationUseCase {
  Future<Either<Exception, UserInformationEntity>> call();
}
