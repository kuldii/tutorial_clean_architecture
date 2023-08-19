import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/data_user_reqres.dart';
import '../repositories/reqres_repository.dart';

class GetDataUserReqresById {
  final ReqresRepository reqresRepository;

  const GetDataUserReqresById({required this.reqresRepository});

  Future<Either<Failure, DataUserReqres>> call({required int id}) async {
    return await reqresRepository.getDataUserReqresById(id);
  }
}
