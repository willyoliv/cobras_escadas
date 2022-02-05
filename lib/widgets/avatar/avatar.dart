import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Avatar extends StatelessWidget {
  final double bottomPosicao;
  final double leftPosicao;
  final String urlAvatar;

  const Avatar({
    Key? key,
    required this.bottomPosicao,
    required this.leftPosicao,
    required this.urlAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottomPosicao,
      left: leftPosicao,
      child: Lottie.asset(
        urlAvatar,
        width: 53,
        height: 53,
      ),
    );
  }
}
