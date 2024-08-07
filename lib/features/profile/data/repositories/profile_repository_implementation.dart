import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/local_datasource.dart';
import '../datasources/remote_datasource.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImplementation extends ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final ProfileLocalDataSource profileLocalDataSource;
  final Box box;

  ProfileRepositoryImplementation({
    required this.profileLocalDataSource,
    required this.profileRemoteDataSource,
    required this.box,
  });

  @override
  Future<Either<Failure, List<Profile>>> getAllUser(int page) async {
    try {
      // Check internet
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        // No available network
        // Ngambil dari Local Datasource
        List<ProfileModel> hasil = await profileLocalDataSource.getAllUser(page);
        return Right(hasil);
      } else {
        // Available network
        // Ngambil dari Remote Datasource
        List<ProfileModel> hasil = await profileRemoteDataSource.getAllUser(page);
        // Put last data profile ke Box Local
        box.put("getAllUser", hasil);
        return Right(hasil);
      }
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Profile>> getUser(int id) async {
    try {
      // Check internet
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        // No available network
        // Ngambil dari Local Datasource
        ProfileModel hasil = await profileLocalDataSource.getUser(id);
        return Right(hasil);
      } else {
        // Available network
        // Ngambil dari Remote Datasource
        ProfileModel hasil = await profileRemoteDataSource.getUser(id);
        // Put last data profile ke Box Local
        box.put("getUser", hasil);
        return Right(hasil);
      }
    } catch (e) {
      return Left(Failure());
    }
  }
}
