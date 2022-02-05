import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:cobras_escadas/shared/theme/colors/app_colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Lottie.asset("assets/lottie/tabuleiro_animacao.json",
                    repeat: true),
              ),
              const Text(
                "Cobras e Escadas",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Bem-vindo",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  child: const Text(
                    "Iniciar jogo",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.roxo,
                    elevation: 0,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/jogo");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
