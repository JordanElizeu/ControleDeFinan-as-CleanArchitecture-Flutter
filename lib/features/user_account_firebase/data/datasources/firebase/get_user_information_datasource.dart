import 'package:controle_financeiro/features/user_account_firebase/data/model/user_information_model.dart';
import 'package:dartz/dartz.dart';

abstract class GetUserInformationDataSource{
  Future<Either<Exception, UserInformationModel>> call();
}