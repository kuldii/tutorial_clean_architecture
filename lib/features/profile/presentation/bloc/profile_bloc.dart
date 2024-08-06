import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/profile.dart';
import '../../domain/usecases/get_all_user.dart';
import '../../domain/usecases/get_user.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetAllUser getAllUser;
  final GetUser getUser;

  ProfileBloc({
    required this.getAllUser,
    required this.getUser,
  }) : super(ProfileStateEmpty()) {
    on<ProfileEventGetAllUsers>((event, emit) async {
      emit(ProfileStateLoading());
      Either<Failure, List<Profile>> hasilGetAllUser = await getAllUser.execute(event.page);
      hasilGetAllUser.fold(
        (leftHasilGetAllUser) {
          emit(ProfileStateError("Cannot get all users"));
        },
        (rightHasilGetAllUser) {
          emit(ProfileStateLoadedAllUsers(rightHasilGetAllUser));
        },
      );
    });
    on<ProfileEventGetDetailUser>((event, emit) async {
      emit(ProfileStateLoading());
      Either<Failure, Profile> hasilGetUser = await getUser.execute(event.userId);
      hasilGetUser.fold(
        (leftHasilGetUser) {
          emit(ProfileStateError("Cannot get detail users"));
        },
        (rightHasilGetUser) {
          emit(ProfileStateLoadedUser(rightHasilGetUser));
        },
      );
    });
  }
}
