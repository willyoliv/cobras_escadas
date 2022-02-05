import 'package:flutter/material.dart';

class Dados extends StatelessWidget {
  final String urlImagem;

  const Dados({Key? key, required this.urlImagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      alignment: Alignment.center,
      child: Image.asset(
        urlImagem,
        width: 80,
        height: 80,
        fit: BoxFit.fill,
      ),
    );
  }
}
