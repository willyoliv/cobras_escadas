import 'package:cobras_escadas/shared/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class Regras extends StatelessWidget {
  const Regras({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Regras",
          style: TextStyle(color: AppColors.roxo),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(color: AppColors.roxo),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  text: '1 - O jogo possui dois jogadores. O ',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'azul',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.azul,
                      ),
                    ),
                    const TextSpan(text: ' e o '),
                    TextSpan(
                      text: 'vermelho',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.vermelho,
                      ),
                    ),
                    const TextSpan(text: ';'),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '2 - O jogador ',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'azul',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: AppColors.azul),
                    ),
                    const TextSpan(
                        text: ' come??a e alterna sua vez com o jogador '),
                    TextSpan(
                      text: 'vermelho',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.vermelho),
                    ),
                    const TextSpan(text: ';'),
                  ],
                ),
              ),
              const Text(
                '3 - Um jogador deve jogar dois dados e somar sua posi????o atual ao valor '
                'da soma dos dados sempre em ordem crescente, do 1 at?? o 100;',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const Text(
                '4 - Caso o valor de ambos os dados seja igual, o jogador atual ganha uma nova jogada;',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const Text(
                '5 - Caso um jogador pare em uma casa que ?? a base de uma escada, ele '
                'obrigatoriamente deve subir at?? a casa em que est?? o topo da escada;',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const Text(
                '6 - Caso um jogador pare em uma casa em que est?? localizada a cabe??a de '
                'uma cobra, ele vai obrigatoriamente deve descer at?? o casa onde est?? a'
                'ponta da cauda da cobra;',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const Text(
                '7 - Um jogador deve cair exatamente na ??ltima casa (100) para vencer o jogo. '
                'O primeiro jogador a fazer isso, vence. Mas se o somat??rio dos dados com a '
                'casa atual for maior que 100, o jogador deve se movimentar para tr??s at?? a '
                'contagem terminar, como se ele tivesse batido em uma parede e retornasse;',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const Text(
                '8 - Se um jogador tirar dados iguais e chegar exatamente na casa 100 sem '
                'movimentos restantes, ent??o o jogador vence o jogo e n??o precisa jogar '
                'novamente.',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const Spacer(),
              const Text(
                'Divirtam-se!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
