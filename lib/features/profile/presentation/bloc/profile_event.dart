part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {}

class ProfileEventGetAllUsers extends ProfileEvent {
  final int page;

  ProfileEventGetAllUsers(this.page);

  @override
  List<Object?> get props => [
        page,
      ];
}

class ProfileEventGetDetailUser extends ProfileEvent {
  final int userId;

  ProfileEventGetDetailUser(this.userId);

  @override
  List<Object?> get props => [
        userId,
      ];
}
