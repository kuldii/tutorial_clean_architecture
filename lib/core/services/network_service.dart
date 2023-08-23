import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkService {
  Future<bool> get isConnected;
  Stream<ConnectivityResult> streamConnection();
}

class NetworkServiceImpl extends NetworkService {
  final Connectivity connectivity;

  NetworkServiceImpl({
    required this.connectivity,
  });

  @override
  Future<bool> get isConnected async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) return Future.value(false);
    return Future.value(true);
  }

  @override
  Stream<ConnectivityResult> streamConnection() async* {
    yield* connectivity.onConnectivityChanged;
  }
}
