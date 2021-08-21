import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortly/bloc/link_bloc.dart';
import 'package:shortly/view/shorter_screen/shorter.dart';
import 'package:shortly/view/splash_screen/splash_screen.dart';
import 'package:shortly/view/start_screen/start_screen.dart';

import 'bloc/link_state.dart';
import 'constant.dart';
import 'database/link.dart';

void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static var database = AppDatabase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: start,
      routes: {
        start: (context) => StartScreen(),
        splash: (context) => SplashScreen(),
        shorter: (context) => BlocProvider<LinkBloc>(
              create: (context) => LinkBloc(InitialState()),
              child: ShorterScreen(),
            ),
      },
      title: app_name,

    );
  }
}
