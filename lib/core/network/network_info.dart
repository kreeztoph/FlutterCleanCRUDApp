import 'package:cross_connectivity/cross_connectivity.dart';

abstract class NetworkInfo {
  Future<bool> get isDeviceConnected;
}

class NetworkConnectionImpl implements NetworkInfo {
  NetworkConnectionImpl(this._connectivity);
  final Connectivity _connectivity;

  @override
  Future<bool> get isDeviceConnected => _connectivity.checkConnection();
}
