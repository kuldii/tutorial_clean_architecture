import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List<dynamic> props = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  final String message;
  const ServerFailure({required this.message});
  @override
  List<Object?> get props => [message];
}

class ConnectionFailure extends Failure {
  final String message;
  const ConnectionFailure({required this.message});
  @override
  List<Object?> get props => [message];
}
