import 'dart:math';

import 'package:cobras_escadas/models/jogador.dart';
import 'package:cobras_escadas/models/tabuleiro.dart';

class CobrasEscadas {
  late Tabuleiro _tabuleiro;
  late Jogador _jogador1;
  late Jogador _jogador2;
  bool _isJogadorInicial = true;

  Jogador get jogador1 => _jogador1;
  Jogador get jogador2 => _jogador2;
  Tabuleiro get tabuleiro => _tabuleiro;
  bool get isJogadorInicial => _isJogadorInicial;

  CobrasEscadas() {
    _jogador1 = Jogador("Jogador 1", 0);
    _jogador2 = Jogador("Jogador 2", 0);
    _tabuleiro = Tabuleiro();
  }

  List<List<double>> jogar(int dado1, int dado2) {
    int soma = dado1 + dado2;
    List<List<double>> caminho = _obterCaminho(soma);
    return caminho;
  }

  int girarDados() {
    int menorValor = 1;
    int maiorValor = 6;
    var rn = Random();
    return menorValor + rn.nextInt(maiorValor - menorValor + 1);
  }

  // List<double> obterCoordanadas(int index) {
  //   return _tabuleiro.obterCoordenadas(index);
  // }

  List<List<double>> _obterCaminho(int posicaoFinal) {
    int posicaoInicial = obterPosicaoAtualDoJogador();
    int finalCaminho = posicaoInicial + posicaoFinal;

    List<List<double>> caminho =
        _tabuleiro.obterCaminho(posicaoInicial, finalCaminho);
    _atualizarPosicaoJogador(
        _tabuleiro.movimentacoes.indexOf(caminho.last) + 1);
    return _tabuleiro.obterCaminho(posicaoInicial, finalCaminho);
  }

  int obterPosicaoAtualDoJogador() {
    if (_isJogadorInicial) {
      return _jogador1.posicaoAtual;
    } else {
      return _jogador2.posicaoAtual;
    }
  }

  void _atualizarPosicaoJogador(int novaPosicao) {
    if (_isJogadorInicial) {
      _jogador1.setPosicaoAtual = novaPosicao;
    } else {
      _jogador2.setPosicaoAtual = novaPosicao;
    }
  }

  void trocarJogador() {
    _isJogadorInicial = !_isJogadorInicial;
  }
}
