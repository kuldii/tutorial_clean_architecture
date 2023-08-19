part of 'data_user_reqres_bloc.dart';

abstract class DataUserReqresEvent extends Equatable {
  const DataUserReqresEvent([List<dynamic> props = const <dynamic>[]]);
}

class DataUserReqresEventGetRandomDataUserReqres extends DataUserReqresEvent {
  @override
  List<Object?> get props => [];
}

class DataUserReqresEventGetByIdDataUserReqres extends DataUserReqresEvent {
  final int id;

  const DataUserReqresEventGetByIdDataUserReqres({required this.id});
  @override
  List<Object?> get props => [id];
}
