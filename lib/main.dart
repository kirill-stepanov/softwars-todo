import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:softwars_todo/logic/provider/filters.dart';
import 'package:softwars_todo/logic/provider/todo_list.dart';
import 'package:softwars_todo/logic/services/shared_preferences_service.dart';
import 'package:softwars_todo/logic/services/snackbar_service.dart';
import 'package:softwars_todo/ui/constants/app_routes.dart';
import 'package:softwars_todo/ui/constants/colors.dart';

import 'package:softwars_todo/ui/screens/home/index.dart';
import 'package:softwars_todo/ui/screens/login/index.dart';
import 'package:softwars_todo/ui/screens/todo_form/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();

  // SharedPreferences _prefs = await SharedPreferences.getInstance();
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoListProvider()),
        ChangeNotifierProvider(create: (_) => FiltersProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         scaffoldBackgroundColor: AppColors.kBackground,
//       ),
//       debugShowCheckedModeBanner: false,
//       initialRoute: AppRoutes.login,
//       routes: {
//         AppRoutes.home: (context) => const HomeScreen(),
//         AppRoutes.login: (context) => const LoginScreen(),
//         AppRoutes.todoForm: (context) => const TodoFormScreen(),
//       },
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool isConnectedToInternet = false;
  // final SnackbarService _snackbarService = SnackbarService();

  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    result = await _connectivity.checkConnectivity();

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    if (!mounted) return;

    final TodoListProvider todoList =
        Provider.of<TodoListProvider>(context, listen: false);

    setState(() {
      _connectionStatus = result;
    });

    if (result[0] == ConnectivityResult.wifi ||
        result[0] == ConnectivityResult.mobile) {
      todoList.updateChangesAfterRestoreInternet();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kBackground,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.todoForm: (context) => const HomeScreen(),
      },
    );
  }
}
