import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/data_user_reqres.dart';

abstract class ReqresRepository {
  Future<Either<Failure, DataUserReqres>> getDataUserReqresRandom();
  Future<Either<Failure, DataUserReqres>> getDataUserReqresById(int id);
}
