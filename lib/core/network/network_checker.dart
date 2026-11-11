import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class NetworkChecker {
  Future<bool> isOnline();

  Stream<bool> watch();
}

class LiveNetworkChecker implements NetworkChecker {
  LiveNetworkChecker({Connectivity? connectivity, this.probeHost})
    : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;
  final String? probeHost;
  static const probeTimeout = Duration(seconds: 3);

  @override
  Future<bool> isOnline() async {
    final links = await _connectivity.checkConnectivity();
    if (_hasInterface(links)) {
      return true;
    }
    return _canReachNetwork();
  }

  @override
  Stream<bool> watch() async* {
    yield await isOnline();
    yield* _connectivity.onConnectivityChanged.asyncMap((links) async {
      if (_hasInterface(links)) {
        return true;
      }
      return _canReachNetwork();
    });
  }

  bool _hasInterface(List<ConnectivityResult> links) {
    return links.any((link) => link != ConnectivityResult.none);
  }

  Future<bool> _canReachNetwork() async {
    try {
      final hosts = await InternetAddress.lookup(
        probeHost ?? 'one.one.one.one',
      ).timeout(probeTimeout);
      return hosts.isNotEmpty;
    } on Object {
      return false;
    }
  }
}

final networkCheckerProvider = Provider<NetworkChecker>(
  (ref) => LiveNetworkChecker(),
);

final networkStatusProvider = StreamProvider<bool>((ref) {
  return ref.watch(networkCheckerProvider).watch();
});
