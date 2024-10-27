import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() onclickReiniciar;
  const Resultado(
      {super.key, required this.nota, required this.onclickReiniciar});

  String get fraseResultado {
    if (nota == 0) {
      return 'Que triste! Você errou todas as questões. Tente novamente!';
    } else if (nota == 1) {
      return 'Eita! Você acertou apenas uma questão.';
    } else if (nota == 2) {
      return 'Ok! Você acertou duas questões. Continue estudando.';
    } else if (nota == 3) {
      return 'Bom! Você acertou três questões. É uma bela nota.';
    } else if (nota == 4) {
      return 'Quase! Você acertou quatro perguntas. Passou perto da nota máxima!';
    } else {
      return 'Parabéns! Você acertou todas as perguntas.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            fraseResultado,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: onclickReiniciar,
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue),
            child: const Text(
              'Reiniciar',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
