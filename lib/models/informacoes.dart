import 'package:cobras_escadas/shared/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class Informacoes {
  static final List<Widget> informacoesIniciais = [
    RichText(
      text: TextSpan(
        text: '- O jogo possui dois jogadores. O ',
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
        text: '- O jogador ',
        style: const TextStyle(color: Colors.black, fontSize: 16),
        children: [
          TextSpan(
            text: 'azul',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: AppColors.azul),
          ),
          const TextSpan(text: ' inicia o jogo;'),
        ],
      ),
    ),
    const Text(
      '- O jogo começa com todos fora do tabuleiro;',
      style: TextStyle(color: Colors.black, fontSize: 16),
    ),
    const Text(
        '- A cada rodada o jogador deve clicar no botao "Jogar" para realizar sua jogada;'),
    const Text(
      '- Ganha aquele que chegar primeiro a casa 100;',
      style: TextStyle(color: Colors.black, fontSize: 16),
    ),
    const Text(
      '- Para visualizar todas as regras clique no botão de informações no canto superior direito.',
      style: TextStyle(color: Colors.black, fontSize: 16),
    ),
    const Spacer(),
    const Text(
      'Divirtam-se!',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    )
  ];

  static final List<Widget> informacoesCaiuNaBaseDaEscada = [
    const Text(
      "Você caiu na base de uma escada! Vocês será levado até o topo dela.",
      style: TextStyle(color: Colors.black, fontSize: 16),
    )
  ];

  static final List<Widget> informacoesCaiuNaCabecaDaCobra = [
    const Text(
      "Você deu azar, caiu na cabeça de uma cobra! Vocês será levado até o final dela.",
      style: TextStyle(color: Colors.black, fontSize: 16),
    )
  ];

  static final List<Widget> fimDeJogo = [
    const Text(
      "O jogo acabou!",
      style: TextStyle(color: Colors.black, fontSize: 16),
    )
  ];
}
