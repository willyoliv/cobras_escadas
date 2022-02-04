import 'package:cobras_escadas/models/cobras_escadas.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _cobrasEscadas;
  late List<double> _posicaoJogador1;
  late List<double> _posicaoJogador2;
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  bool _desabilitarButton = false;
  int dado1 = 1;
  int dado2 = 1;
  int soma = 0;

  @override
  void initState() {
    super.initState();
    _cobrasEscadas = CobrasEscadas();
    _posicaoJogador1 = [10, -8];
    _posicaoJogador2 = [10, 30];

    _exibirMensagem();
  }

  void _movimentarPeca(List<List<double>> movimentacoes) async {
    bool isJogadorInicial = _cobrasEscadas.isJogadorInicial;
    for (var coordenadas in movimentacoes) {
      await Future.delayed(const Duration(milliseconds: 500), () {
        if (isJogadorInicial) {
          setState(() {
            _posicaoJogador1 = coordenadas;
          });
        } else {
          setState(() {
            _posicaoJogador2 = coordenadas;
          });
        }
      });
    }
    setState(() {
      _desabilitarButton = false;
    });
    _cobrasEscadas.trocarJogador();
  }

  Future<void> _exibirMensagem() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informações iniciais'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          content: Container(
            height: 300,
            // alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: '1 - O jogo possui dois jogadores. O ',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'azul',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF068BF7),
                        ),
                      ),
                      TextSpan(text: ' e o '),
                      TextSpan(
                        text: 'vermelho',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD70077),
                        ),
                      ),
                      TextSpan(text: ';'),
                    ],
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    text: '2 - O jogador ',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'azul',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF068BF7),
                        ),
                      ),
                      TextSpan(text: ' inicia o jogo;'),
                    ],
                  ),
                ),
                const Text('3 - O jogo inicia com todos fora do tabuleiro;'),
                const Text(
                    '4 - Cada rodada o jogar deve clicar no botao "Jogar" para realizar sua jogada;'),
                const Text('5 - Ganha aquele que chegar primeiro a casa 100;'),
                const Text(
                    '6 - Para visualizar todas as regras clique no menu.'),
                const Spacer(),
                const Text(
                  'Divirtam-se!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Cobras e Escadas",
          style: TextStyle(color: Color(0xFF005C83)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.info_outline,
                color: Color(0xFF005C83),
              ))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 440,
              width: 440,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/tabuleiro.png",
                    width: 400,
                    height: 400,
                  ),
                  Positioned(
                    // #068BF7, #D70077
                    bottom: _posicaoJogador2[0],
                    left: _posicaoJogador2[1],
                    child: Lottie.asset(
                      "assets/lottie/jogador_2.json",
                      width: 53,
                      height: 53,
                    ),
                  ),
                  Positioned(
                    // #068BF7, #D70077
                    bottom: _posicaoJogador1[0],
                    left: _posicaoJogador1[1],
                    child: Lottie.asset(
                      "assets/lottie/jogador_1.json",
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
                const Text("Vez do Jogador"),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: _cobrasEscadas.isJogadorInicial
                        ? const Color(0xFF068BF7)
                        : const Color(0xFFD70077),
                    borderRadius: BorderRadius.circular(30),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: _cobrasEscadas.isJogadorInicial
                        ? const Color(0xFF068BF7)
                        : const Color(0xFFD70077),
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
                          int novoValorDado1 = _cobrasEscadas.girarDados();
                          int novoValorDado2 = _cobrasEscadas.girarDados();
                          setState(() {
                            dado1 = novoValorDado1;
                            dado2 = novoValorDado2;
                            soma = dado1 + dado2;
                          });
                          List<List<double>> caminho = _cobrasEscadas.jogar(
                              novoValorDado1, novoValorDado2);
                          setState(() {
                            _movimentarPeca(caminho);
                            _desabilitarButton = true;
                          });
                        },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
