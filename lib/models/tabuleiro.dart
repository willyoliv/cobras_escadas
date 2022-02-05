class Tabuleiro {
  final List<List<double>> _movimentacoes = [
    // [10, -8],
    [30, -8],
    [30, 30],
    [30, 65],
    [30, 100],
    [30, 137],
    [30, 172],
    [30, 208],
    [30, 245],
    [30, 282],
    [30, 317],
    [65, 317],
    [65, 282],
    [65, 245],
    [65, 208],
    [65, 172],
    [65, 137],
    [65, 100],
    [65, 65],
    [65, 30],
    [65, -8],
    [102, -8],
    [102, 30],
    [102, 65],
    [102, 100],
    [102, 137],
    [102, 172],
    [102, 208],
    [102, 245],
    [102, 282],
    [102, 317],
    [138, 317],
    [138, 282],
    [138, 245],
    [138, 208],
    [138, 172],
    [138, 137],
    [138, 100],
    [138, 65],
    [138, 30],
    [138, -8],
    [174, -8],
    [174, 30],
    [174, 65],
    [174, 100],
    [174, 137],
    [174, 172],
    [174, 208],
    [174, 245],
    [174, 282],
    [174, 317],
    [210, 317],
    [210, 282],
    [210, 245],
    [210, 208],
    [210, 172],
    [210, 137],
    [210, 100],
    [210, 65],
    [210, 30],
    [210, -8],
    [247, -8],
    [247, 30],
    [247, 65],
    [247, 100],
    [247, 137],
    [247, 172],
    [247, 208],
    [247, 245],
    [247, 282],
    [247, 317],
    [282, 317],
    [282, 282],
    [282, 245],
    [282, 208],
    [282, 172],
    [282, 137],
    [282, 100],
    [282, 65],
    [282, 30],
    [282, -8],
    [318, -8],
    [318, 30],
    [318, 65],
    [318, 100],
    [318, 137],
    [318, 172],
    [318, 208],
    [318, 245],
    [318, 282],
    [318, 317],
    [354, 317],
    [354, 282],
    [354, 245],
    [354, 208],
    [354, 172],
    [354, 137],
    [354, 100],
    [354, 65],
    [354, 30],
    [354, -8],
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
  final List<int> _posicoesIniciaisDasEscadas = [
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
      return caminho;
    } else {
      caminho = _movimentacoes.sublist(posicaoInicial, posicaoFinal);
    }

    return caminho;
  }

  bool verificarSePosicaoECabecaDeCobra(int posicao) {
    return _posicoesCabecasDasCobras.contains(posicao);
  }

  bool verificarSePosicaoEInicioDaEscada(int posicao) {
    return _posicoesIniciaisDasEscadas.contains(posicao);
  }

  List<List<double>> obterCaminhoUsandoEscada(int posicao) {
    List<List<double>> caminho = [];
    switch (posicao) {
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
    return caminho;
  }

  List<List<double>> obterCaminhoDaCobra(int posicao) {
    List<List<double>> caminho = [];
    switch (posicao) {
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
    return caminho;
  }
}
