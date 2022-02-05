import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:cobras_escadas/models/cobras_escadas.dart';
import 'package:cobras_escadas/models/informacoes.dart';
import 'package:cobras_escadas/shared/theme/colors/app_colors.dart';
import 'package:cobras_escadas/widgets/mensagens.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  late CobrasEscadas _cobrasEscadas;
  late List<double> _posicaoJogador1;
  late List<double> _posicaoJogador2;
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  bool _desabilitarButton = false;
  bool _exibirAvatarRoxo = false;
  int dado1 = 1;
  int dado2 = 1;
  int soma = 0;

  @override
  void initState() {
    super.initState();
    _cobrasEscadas = CobrasEscadas();
    _posicaoJogador1 = [-10, -8];
    _posicaoJogador2 = [-10, 30];

    _exibirMensagem(
        Informacoes.informacoesIniciais, 300, 'Informações Iniciais');
  }

  Future<void> _movimentarCaminhoExtra(
      List<List<double>> move, bool isJogadorInicial) async {
    for (var coordenadas in move) {
      await Future.delayed(const Duration(milliseconds: 500), () {
        if (isJogadorInicial) {
          _posicaoJogador1 = coordenadas;
        } else {
          _posicaoJogador2 = coordenadas;
        }
        if (_posicaoJogador1 == _posicaoJogador2) {
          _exibirAvatarRoxo = true;
        } else {
          _exibirAvatarRoxo = false;
        }
        setState(() {});
      });
    }
  }

  void _movimentarPeca(List<List<double>> movimentacoes) async {
    bool isJogadorInicial = _cobrasEscadas.isJogadorInicial;
    await _movimentarCaminhoExtra(movimentacoes, isJogadorInicial);

    int pos = _cobrasEscadas.obterPosicaoAtualDoJogador();
    if (_cobrasEscadas.tabuleiro.verificarSePosicaoECabecaDeCobra(pos)) {
      List<List<double>> move =
          _cobrasEscadas.tabuleiro.obterCaminhoDaCobra(pos);
      await _exibirMensagem(
          Informacoes.informacoesCaiuNaCabecaDaCobra, 60, "Ops!!");
      await _movimentarCaminhoExtra(move, isJogadorInicial);
      _cobrasEscadas.atualizarPosicaoJogador(move);
    }

    if (_cobrasEscadas.tabuleiro.verificarSePosicaoEInicioDaEscada(pos)) {
      List<List<double>> move =
          _cobrasEscadas.tabuleiro.obterCaminhoUsandoEscada(pos);
      await _exibirMensagem(
          Informacoes.informacoesCaiuNaBaseDaEscada, 60, "Que sorte!!");
      await _movimentarCaminhoExtra(move, isJogadorInicial);

      _cobrasEscadas.atualizarPosicaoJogador(move);
    }

    _desabilitarButton = false;
    if (_cobrasEscadas.verificarGanhador()) {
      _exibirMensagem([
        RichText(
          text: TextSpan(
            text: 'Jogador ',
            style: const TextStyle(color: Colors.black, fontSize: 16),
            children: [
              TextSpan(
                text: _cobrasEscadas.obterNomeJogador(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _cobrasEscadas.isJogadorInicial
                      ? const Color(0xFF068BF7)
                      : const Color(0xFFD70077),
                ),
              ),
              const TextSpan(text: ' Venceu!'),
            ],
          ),
        ),
      ], 20, "Parabéns!");
    } else {
      if (dado1 != dado2) {
        _cobrasEscadas.trocarJogador();
      }
    }

    setState(() {});
  }

  Future<void> _exibirMensagem(
      List<Widget> widgets, double altura, String titulo) async {
    await Future.delayed(const Duration(milliseconds: 50));
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Mensagem(widgets: widgets, altura: altura, titulo: titulo);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Cobras e Escadas",
          style: TextStyle(color: AppColors.roxo),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(color: AppColors.roxo),
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              Navigator.pushNamed(context, "/regras");
            },
            icon: FaIcon(
              FontAwesomeIcons.questionCircle,
              color: AppColors.roxo,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 420,
                width: 400,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/tabuleiro.png",
                      width: 400,
                      height: 400,
                    ),
                    if (!_exibirAvatarRoxo)
                      Positioned(
                        bottom: _posicaoJogador2[0],
                        left: _posicaoJogador2[1],
                        child: Lottie.asset(
                          "assets/lottie/jogador_2.json",
                          width: 53,
                          height: 53,
                        ),
                      ),
                    if (!_exibirAvatarRoxo)
                      Positioned(
                        bottom: _posicaoJogador1[0],
                        left: _posicaoJogador1[1],
                        child: Lottie.asset(
                          "assets/lottie/jogador_1.json",
                          width: 53,
                          height: 53,
                        ),
                      ),
                    if (_exibirAvatarRoxo)
                      Positioned(
                        bottom: _posicaoJogador1[0],
                        left: _posicaoJogador1[1],
                        child: Lottie.asset(
                          "assets/lottie/jogador_roxo.json",
                          width: 53,
                          height: 53,
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Vez do Jogador",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: _cobrasEscadas.isJogadorInicial
                          ? AppColors.azul
                          : AppColors.vermelho,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'O jogador ',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(
                          text: _cobrasEscadas.obterNomeJogador(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _cobrasEscadas.isJogadorInicial
                                ? AppColors.azul
                                : AppColors.vermelho,
                          ),
                        ),
                        TextSpan(
                            text:
                                ' está na posição ${_cobrasEscadas.obterPosicaoAtualDoJogador()}.'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/dado_$dado1.png",
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/dado_$dado2.png",
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Text(soma == 0 ? "" : "Soma dos dados:  $soma"),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: _cobrasEscadas.isJogadorInicial
                          ? AppColors.azul
                          : AppColors.vermelho,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: const [
                        FaIcon(FontAwesomeIcons.dice),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Jogar")
                      ],
                    ),
                    onPressed: _desabilitarButton
                        ? null
                        : () {
                            if (!_cobrasEscadas.verificarGanhador()) {
                              int novoValorDado1 = _cobrasEscadas.girarDados();
                              int novoValorDado2 = _cobrasEscadas.girarDados();
                              setState(() {
                                dado1 = novoValorDado1;
                                dado2 = novoValorDado2;
                                soma = dado1 + dado2;
                                _desabilitarButton = true;
                              });
                              List<List<double>> caminho = _cobrasEscadas.jogar(
                                  novoValorDado1, novoValorDado2);
                              _movimentarPeca(caminho);
                            } else {
                              _exibirMensagem(
                                  Informacoes.fimDeJogo, 20, "Jogo Encerrado!");
                            }
                          },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
