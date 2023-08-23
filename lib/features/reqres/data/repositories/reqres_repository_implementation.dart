import 'package:dartz/dartz.dart';
import 'package:myapps/core/services/network_service.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/data_user_reqres.dart';
import '../../domain/repositories/reqres_repository.dart';
import '../datasources/data_user_reqres_remote_data_source.dart';
import '../models/data_user_reqres_model.dart';

class ReqresRepositoryImpl extends ReqresRepository {
  final NetworkService networkService;
  final DataUserReqresRemoteDataSource dataUserReqresRemoteDataSource;

  ReqresRepositoryImpl({
    required this.networkService,
    required this.dataUserReqresRemoteDataSource,
  });

  @override
  Future<Either<Failure, DataUserReqres>> getDataUserReqresById(int id) async {
    try {
      bool isConnected = true;
      isConnected = await networkService.isConnected;
      if (isConnected == false) return const Left(ConnectionFailure(message: "No internet connection"));
      DataUserReqresModel dataUserReqres = await dataUserReqresRemoteDataSource.getDataUserReqresById(id);
      return Right(dataUserReqres);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(GeneralFailure(message: "Cannot get data user by id"));
    }
  }

  @override
  Future<Either<Failure, DataUserReqres>> getDataUserReqresRandom() async {
    try {
      bool isConnected = true;
      isConnected = await networkService.isConnected;
      if (isConnected == false) return const Left(ConnectionFailure(message: "No internet connection"));
      DataUserReqresModel dataUserReqres = await dataUserReqresRemoteDataSource.getDataUserReqresRandom();
      return Right(dataUserReqres);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(GeneralFailure(message: "Cannot get data user random"));
    }
  }
}
