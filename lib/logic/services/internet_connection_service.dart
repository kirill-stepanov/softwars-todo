// import 'dart:convert';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';

// class InternetConnectionService {
//   List<ConnectivityResult> connectionStatus = [ConnectivityResult.none];
//   final Connectivity connectivity = Connectivity();
//   late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;

//   Future<void> initConnectivity() async {
//     late List<ConnectivityResult> result;
//     result = await connectivity.checkConnectivity();

//     // if (!mounted) {
//     // return Future.value(null);
//     // }

//     return updateConnectionStatus(result);
//   }

//   Future<void> updateConnectionStatus(List<ConnectivityResult> result) async {
//     connectionStatus = result;
//     // ignore: avoid_print
//   }

// }
