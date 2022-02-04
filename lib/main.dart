import 'package:flutter/material.dart';

import 'package:cobras_escadas/pages/home/home.dart';
import 'package:cobras_escadas/pages/jogo/jogo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake and Ladders',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/jogo": (context) => const Jogo(),
      },
    );
  }
}
