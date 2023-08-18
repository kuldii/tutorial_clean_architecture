import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/data_user_reqres.dart';
import '../repositories/data_user_reqres_repository.dart';

class GetDataUserReqresById {
  final DataUserReqresRepository dataUserReqresRepository;

  const GetDataUserReqresById({required this.dataUserReqresRepository});

  Future<Either<Failure, DataUserReqres>> call({required int id}) async {
    return await dataUserReqresRepository.getDataUserReqresById(id);
  }
}
