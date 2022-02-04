class Tabuleiro {
  final List<List<double>> _movimentacoes = [
    // [10, -8],
    [50, -8],
    [50, 30],
    [50, 65],
    [50, 100],
    [50, 137],
    [50, 172],
    [50, 208],
    [50, 245],
    [50, 282],
    [50, 317],
    [85, 317],
    [85, 282],
    [85, 245],
    [85, 208],
    [85, 172],
    [85, 137],
    [85, 100],
    [85, 65],
    [85, 30],
    [85, -8],
    [122, -8],
    [122, 30],
    [122, 65],
    [122, 100],
    [122, 137],
    [122, 172],
    [122, 208],
    [122, 245],
    [122, 282],
    [122, 317],
    [158, 317],
    [158, 282],
    [158, 245],
    [158, 208],
    [158, 172],
    [158, 137],
    [158, 100],
    [158, 65],
    [158, 30],
    [158, -8],
    [194, -8],
    [194, 30],
    [194, 65],
    [194, 100],
    [194, 137],
    [194, 172],
    [194, 208],
    [194, 245],
    [194, 282],
    [194, 317],
    [230, 317],
    [230, 282],
    [230, 245],
    [230, 208],
    [230, 172],
    [230, 137],
    [230, 100],
    [230, 65],
    [230, 30],
    [230, -8],
    [267, -8],
    [267, 30],
    [267, 65],
    [267, 100],
    [267, 137],
    [267, 172],
    [267, 208],
    [267, 245],
    [267, 282],
    [267, 317],
    [302, 317],
    [302, 282],
    [302, 245],
    [302, 208],
    [302, 172],
    [302, 137],
    [302, 100],
    [302, 65],
    [302, 30],
    [302, -8],
    [338, -8],
    [338, 30],
    [338, 65],
    [338, 100],
    [338, 137],
    [338, 172],
    [338, 208],
    [338, 245],
    [338, 282],
    [338, 317],
    [374, 317],
    [374, 282],
    [374, 245],
    [374, 208],
    [374, 172],
    [374, 137],
    [374, 100],
    [374, 65],
    [374, 30],
    [374, -8],
  ];

  final List<int> _posicoesCabecasDasCobras = [
    16,
    46,
    49,
    62,
    64,
    74,
    89,
    92,
    95,
    99
  ];
  final List<int> _posicoesBaseDasEscadas = [
    2,
    7,
    8,
    15,
    21,
    28,
    36,
    51,
    71,
    78,
    87
  ];

  final List<int> _caminhoSubidaEscada2 = [18, 22, 37];
  final List<int> _caminhoSubidaEscada7 = [13];
  final List<int> _caminhoSubidaEscada8 = [11, 28, 30];
  final List<int> _caminhoSubidaEscada15 = [25];
  final List<int> _caminhoSubidaEscada21 = [39, 41];
  final List<int> _caminhoSubidaEscada28 = [33, 45, 54, 64, 75, 83];
  final List<int> _caminhoSubidaEscada36 = [43];
  final List<int> _caminhoSubidaEscada51 = [51, 67, 66];
  final List<int> _caminhoSubidaEscada71 = [89, 90];
  final List<int> _caminhoSubidaEscada78 = [82, 97];
  final List<int> _caminhoSubidaEscada87 = [93];

  final List<int> _caminhoDescidaNaCobra16 = [3, 4, 5];
  final List<int> _caminhoDescidaNaCobra46 = [34, 35, 36, 23, 24];
  final List<int> _caminhoDescidaNaCobra49 = [47, 32, 31, 28, 11, 10];
  final List<int> _caminhoDescidaNaCobra62 = [58, 41, 42, 37, 38, 21, 18];
  final List<int> _caminhoDescidaNaCobra64 = [62, 57, 58, 59];
  final List<int> _caminhoDescidaNaCobra74 = [
    74,
    65,
    66,
    53,
    54,
    65,
    66,
    53,
    52
  ];
  final List<int> _caminhoDescidaNaCobra89 = [71, 72, 67];
  final List<int> _caminhoDescidaNaCobra92 = [92, 87];
  final List<int> _caminhoDescidaNaCobra95 = [95, 84, 75, 74];
  final List<int> _caminhoDescidaNaCobra99 = [98, 81, 80, 78, 79];

  List<List<double>> get movimentacoes => _movimentacoes;

  void printTabuleiro() {
    print(_movimentacoes);
  }

  List<double> obterCoordenadas(int index) {
    return _movimentacoes[index];
  }

  List<List<double>> obterCaminho(int posicaoInicial, int posicaoFinal) {
    List<List<double>> caminho;
    if (posicaoFinal > 100) {
      caminho = _movimentacoes.sublist(posicaoInicial, 100);
      int posicaoMovimentosParaAtras = 100 - (posicaoFinal - 100);
      List<List<double>> caminhoCasasExtras = _movimentacoes
          .sublist(posicaoMovimentosParaAtras - 1, 99)
          .reversed
          .toList();
      caminho = [...caminho, ...caminhoCasasExtras];
      if (_posicoesCabecasDasCobras.contains(posicaoMovimentosParaAtras)) {
        switch (posicaoMovimentosParaAtras) {
          case 92:
            for (var item in _caminhoDescidaNaCobra92) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 95:
            for (var item in _caminhoDescidaNaCobra95) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 99:
            for (var item in _caminhoDescidaNaCobra99) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          default:
        }
      }
      return caminho;
    } else {
      caminho = _movimentacoes.sublist(posicaoInicial, posicaoFinal);
      print("caminho $caminho");
      if (_posicoesBaseDasEscadas.contains(posicaoFinal)) {
        switch (posicaoFinal) {
          case 2:
            for (var item in _caminhoSubidaEscada2) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 7:
            for (var item in _caminhoSubidaEscada7) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 8:
            for (var item in _caminhoSubidaEscada8) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 15:
            for (var item in _caminhoSubidaEscada15) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 21:
            for (var item in _caminhoSubidaEscada21) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 28:
            for (var item in _caminhoSubidaEscada28) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 36:
            for (var item in _caminhoSubidaEscada36) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 51:
            for (var item in _caminhoSubidaEscada51) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 71:
            for (var item in _caminhoSubidaEscada71) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 78:
            for (var item in _caminhoSubidaEscada78) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 87:
            for (var item in _caminhoSubidaEscada87) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          default:
        }
      } else if (_posicoesCabecasDasCobras.contains(posicaoFinal)) {
        switch (posicaoFinal) {
          case 16:
            for (var item in _caminhoDescidaNaCobra16) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 46:
            for (var item in _caminhoDescidaNaCobra46) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 49:
            for (var item in _caminhoDescidaNaCobra49) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 62:
            for (var item in _caminhoDescidaNaCobra62) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 64:
            for (var item in _caminhoDescidaNaCobra64) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 74:
            for (var item in _caminhoDescidaNaCobra74) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 89:
            for (var item in _caminhoDescidaNaCobra89) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 92:
            for (var item in _caminhoDescidaNaCobra92) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 95:
            for (var item in _caminhoDescidaNaCobra95) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          case 99:
            for (var item in _caminhoDescidaNaCobra99) {
              caminho.add(_movimentacoes[item]);
            }
            break;
          default:
        }
      }
    }

    return caminho;
  }
}
