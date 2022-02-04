class Jogador {
  late String _nome;
  late int _posicaoAtual;

  String get nome => _nome;
  int get posicaoAtual => _posicaoAtual;

  set setPosicaoAtual(int posicaoAtual) {
    _posicaoAtual = posicaoAtual;
  }

  Jogador(String nome, int posicaoAtual) {
    _nome = nome;
    _posicaoAtual = posicaoAtual;
  }
}
