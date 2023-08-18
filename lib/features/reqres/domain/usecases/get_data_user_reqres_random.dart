import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/data_user_reqres.dart';
import '../repositories/data_user_reqres_repository.dart';

class GetDataUserReqresRandom {
  final DataUserReqresRepository dataUserReqresRepository;

  const GetDataUserReqresRandom({required this.dataUserReqresRepository});

  Future<Either<Failure, DataUserReqres>> call() async {
    return await dataUserReqresRepository.getDataUserReqresRandom();
  }
}
