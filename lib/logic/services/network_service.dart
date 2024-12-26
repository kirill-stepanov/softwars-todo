import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>>? _subscription;
  final List<Function()> _retryQueue = [];

  NetworkService() {
    _subscription =
        _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
  }

  void addToRetryQueue(Function() apiCall) {
    _retryQueue.add(apiCall);
  }

  Future<void> _onConnectivityChanged(List<ConnectivityResult> result) async {
    if (result[0] == ConnectivityResult.mobile ||
        result[0] == ConnectivityResult.wifi) {
      _retryFailedRequests();
    }
  }

  void _retryFailedRequests() {
    for (var request in _retryQueue) {
      request();
    }
    _retryQueue.clear();
  }

  void dispose() {
    _subscription?.cancel();
  }
}
