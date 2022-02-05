import 'dart:math';

import 'package:cobras_escadas/models/jogador.dart';
import 'package:cobras_escadas/models/tabuleiro.dart';

class CobrasEscadas {
  late Tabuleiro _tabuleiro;
  late Jogador _jogador1;
  late Jogador _jogador2;
  bool _isJogadorInicial = true;
  bool _hasGanhador = false;

  Jogador get jogador1 => _jogador1;
  Jogador get jogador2 => _jogador2;
  Tabuleiro get tabuleiro => _tabuleiro;
  bool get isJogadorInicial => _isJogadorInicial;

  CobrasEscadas() {
    _jogador1 = Jogador("Azul", 0);
    _jogador2 = Jogador("Vermelho", 0);
    _tabuleiro = Tabuleiro();
  }

  List<List<double>> jogar(int dado1, int dado2) {
    int soma = dado1 + dado2;
    List<List<double>> caminho = _obterCaminho(soma);
    return caminho;
  }

  int girarDados() {
    var random = Random();
    return random.nextInt(6) + 1;
  }

  List<List<double>> _obterCaminho(int posicaoFinal) {
    int posicaoInicial = obterPosicaoAtualDoJogador();
    int finalCaminho = posicaoInicial + posicaoFinal;

    List<List<double>> caminho =
        _tabuleiro.obterCaminho(posicaoInicial, finalCaminho);
    atualizarPosicaoJogador(caminho);
    return _tabuleiro.obterCaminho(posicaoInicial, finalCaminho);
  }

  int obterPosicaoAtualDoJogador() {
    if (_isJogadorInicial) {
      return _jogador1.posicaoAtual;
    } else {
      return _jogador2.posicaoAtual;
    }
  }

  void atualizarPosicaoJogador(List<List<double>> caminho) {
    int novaPosicao = _tabuleiro.movimentacoes.indexOf(caminho.last) + 1;
    if (novaPosicao == 100) {
      _hasGanhador = true;
    }
    if (_isJogadorInicial) {
      _jogador1.setPosicaoAtual = novaPosicao;
    } else {
      _jogador2.setPosicaoAtual = novaPosicao;
    }
  }

  String obterNomeJogador() {
    if (_isJogadorInicial) {
      return _jogador1.nome;
    } else {
      return _jogador2.nome;
    }
  }

  void trocarJogador() {
    _isJogadorInicial = !_isJogadorInicial;
  }

  bool verificarGanhador() {
    return _hasGanhador;
  }
}
