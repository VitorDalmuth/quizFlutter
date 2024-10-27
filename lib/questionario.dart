import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List respostas = (temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : []) as List<dynamic>;
    return Column(children: <Widget>[
      Questao(perguntas[perguntaSelecionada]['texto'] as String),
      ...respostas.map((resp) => Resposta(resp['texto'].toString(),
          () => responder(int.parse(resp['nota'].toString())))),
    ]);
  }
}
