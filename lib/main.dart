import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:provider/provider.dart';

import 'package:softwars_todo/logic/provider/filters.dart';
import 'package:softwars_todo/logic/provider/todo_list.dart';
import 'package:softwars_todo/logic/services/shared_preferences_service.dart';

import 'package:softwars_todo/ui/constants/app_routes.dart';
import 'package:softwars_todo/ui/constants/colors.dart';
import 'package:softwars_todo/ui/screens/home/index.dart';
import 'package:softwars_todo/ui/screens/login/index.dart';
import 'package:softwars_todo/ui/screens/todo_form/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Softwars Todo',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.kBackground),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.todoForm: (context) => const TodoFormScreen(),
      },
    );
  }
}
