import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/data_user_reqres.dart';
import '../repositories/reqres_repository.dart';

class GetDataUserReqresRandom {
  final ReqresRepository reqresRepository;

  const GetDataUserReqresRandom({required this.reqresRepository});

  Future<Either<Failure, DataUserReqres>> call() async {
    return await reqresRepository.getDataUserReqresRandom();
  }
}
