import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/home/home.dart';
import 'pages/jogo/jogo.dart';
import 'pages/regras/regras.dart';
import 'shared/theme/colors/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Snake and Ladders',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/jogo": (context) => const Jogo(),
        "/regras": (context) => const Regras(),
      },
    );
  }
}
