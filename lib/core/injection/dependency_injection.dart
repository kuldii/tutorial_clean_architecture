import 'package:get_it/get_it.dart';

import '../../features/reqres/data/datasources/data_user_reqres_remote_data_source.dart';
import '../../features/reqres/data/repositories/reqres_repository_implementation.dart';
import '../../features/reqres/domain/repositories/reqres_repository.dart';
import '../../features/reqres/domain/usecases/get_data_user_reqres_by_id.dart';
import '../../features/reqres/domain/usecases/get_data_user_reqres_random.dart';
import '../../features/reqres/presentation/bloc/data_user_reqres_bloc/data_user_reqres_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencyInjection() async {
  serviceLocator.registerFactory(
    () => DataUserReqresBloc(
      getDataUserReqresById: serviceLocator.call(),
      getDataUserReqresRandom: serviceLocator.call(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetDataUserReqresById(
      reqresRepository: serviceLocator.call(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetDataUserReqresRandom(
      reqresRepository: serviceLocator.call(),
    ),
  );

  serviceLocator.registerLazySingleton<ReqresRepository>(
    () => ReqresRepositoryImpl(
      dataUserReqresRemoteDataSource: serviceLocator.call(),
    ),
  );

  serviceLocator.registerLazySingleton<DataUserReqresRemoteDataSource>(
    () => DataUserReqresRemoteDataSourceImpl(),
  );
}
