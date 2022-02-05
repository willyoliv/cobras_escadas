import 'package:flutter/material.dart';

class Mensagem extends StatelessWidget {
  final List<Widget> widgets;
  final double altura;
  final String titulo;

  const Mensagem(
      {Key? key,
      required this.widgets,
      required this.altura,
      required this.titulo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titulo),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      content: SizedBox(
        height: altura,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [...widgets],
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
  }
}
