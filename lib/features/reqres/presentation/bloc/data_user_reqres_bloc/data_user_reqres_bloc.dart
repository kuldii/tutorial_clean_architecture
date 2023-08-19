import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myapps/core/error/failure.dart';
import 'package:myapps/features/reqres/domain/entities/data_user_reqres.dart';
import 'package:myapps/features/reqres/domain/usecases/get_data_user_reqres_by_id.dart';
import 'package:myapps/features/reqres/domain/usecases/get_data_user_reqres_random.dart';

part 'data_user_reqres_event.dart';
part 'data_user_reqres_state.dart';

class DataUserReqresBloc extends Bloc<DataUserReqresEvent, DataUserReqresState> {
  final GetDataUserReqresRandom getDataUserReqresRandom;
  final GetDataUserReqresById getDataUserReqresById;

  DataUserReqresBloc({
    required this.getDataUserReqresById,
    required this.getDataUserReqresRandom,
  }) : super(DataUserReqresStateEmpty()) {
    on<DataUserReqresEventGetRandomDataUserReqres>((event, emit) async {
      try {
        emit(DataUserReqresStateLoading());
        Either<Failure, DataUserReqres> hasilGetDataUserReqresRandom = await getDataUserReqresRandom.call();
        hasilGetDataUserReqresRandom.fold(
          (lHasilGetDataUserReqresRandom) {
            if (lHasilGetDataUserReqresRandom is ServerFailure) {
              emit(DataUserReqresStateError(message: lHasilGetDataUserReqresRandom.message));
            } else if (lHasilGetDataUserReqresRandom is GeneralFailure) {
              emit(DataUserReqresStateError(message: lHasilGetDataUserReqresRandom.message));
            } else {
              emit(const DataUserReqresStateError(message: "Cannot get data user random"));
            }
          },
          (rHasilGetDataUserReqresRandom) => emit(DataUserReqresStateLoaded(dataUserReqres: rHasilGetDataUserReqresRandom)),
        );
      } catch (e) {
        emit(const DataUserReqresStateError(message: "Cannot get data user random"));
      }
    });
    on<DataUserReqresEventGetByIdDataUserReqres>((event, emit) async {
      try {
        emit(DataUserReqresStateLoading());
        Either<Failure, DataUserReqres> hasilGetDataUserReqresById = await getDataUserReqresById.call(id: event.id);
        hasilGetDataUserReqresById.fold(
          (lHasilGetDataUserReqresById) {
            if (lHasilGetDataUserReqresById is ServerFailure) {
              emit(DataUserReqresStateError(message: lHasilGetDataUserReqresById.message));
            } else if (lHasilGetDataUserReqresById is GeneralFailure) {
              emit(DataUserReqresStateError(message: lHasilGetDataUserReqresById.message));
            } else {
              emit(const DataUserReqresStateError(message: "Cannot get data user by id"));
            }
          },
          (rHasilGetDataUserReqresById) => emit(DataUserReqresStateLoaded(dataUserReqres: rHasilGetDataUserReqresById)),
        );
      } catch (e) {
        emit(const DataUserReqresStateError(message: "Cannot get data user by id"));
      }
    });
  }
}
