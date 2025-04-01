import 'package:e_commerce/core/storage/auth_local_storage.dart';
import 'package:e_commerce/features/auth/view/page/sign_up/singup_page.dart';
import 'package:e_commerce/features/auth/viewModel/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    AuthLocalStorage().initPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthBloc())],
        child: SingUpPage(),
      ),
    );
  }
}

  // void name(data) async {
  //   await AuthLocalStorage().initPrefs();
  //   logger.i('[main.dart:33] prefs initialized,');

  //   await AuthService().signUp(data);
  // }
