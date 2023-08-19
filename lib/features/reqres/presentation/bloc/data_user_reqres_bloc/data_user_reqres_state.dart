part of 'data_user_reqres_bloc.dart';

abstract class DataUserReqresState extends Equatable {
  const DataUserReqresState([List<dynamic> props = const <dynamic>[]]);
}

class DataUserReqresStateEmpty extends DataUserReqresState {
  @override
  List<Object?> get props => [];
}

class DataUserReqresStateLoading extends DataUserReqresState {
  @override
  List<Object?> get props => [];
}

class DataUserReqresStateLoaded extends DataUserReqresState {
  final DataUserReqres dataUserReqres;

  const DataUserReqresStateLoaded({required this.dataUserReqres});
  @override
  List<Object?> get props => [dataUserReqres];
}

class DataUserReqresStateError extends DataUserReqresState {
  final String message;

  const DataUserReqresStateError({required this.message});
  @override
  List<Object?> get props => [message];
}
