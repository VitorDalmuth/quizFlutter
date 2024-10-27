import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class TelaInicial extends StatelessWidget {
  final void Function() onStart;

  const TelaInicial({required this.onStart, super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Center(
              child: Text(
            'Bem Vindo!',
            style: TextStyle(fontSize: 28),
          )),
          const Center(
              child: Text(
            'Clique no botão abaixo para iniciar o quiz.',
            style: TextStyle(fontSize: 18),
          )),
          ElevatedButton(
            onPressed: onStart,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            child: const Text(
              'Iniciar',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      );
    });
  }
}

class PerguntaAppState extends State<PerguntaApp> {
  int perguntaSelecionada = 0;
  var notaTotal = 0;
  bool mostrandoTelaInicial = true;

  void responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        notaTotal += nota;
      });
    }
    print(notaTotal);
  }

  void reiniciar() {
    setState(() {
      perguntaSelecionada = 0;
      notaTotal = 0;
      mostrandoTelaInicial = true;
    });
  }

  void iniciarQuestionario() {
    setState(() {
      mostrandoTelaInicial = false; // Muda para perguntas
    });
  }

  final perguntas = const [
    {
      'texto': 'Qual é o continente mais populoso?',
      'respostas': [
        {'texto': 'África', 'nota': 0},
        {'texto': 'Europa', 'nota': 0},
        {'texto': 'Ásia', 'nota': 1},
        {'texto': 'América do Sul', 'nota': 0},
      ],
    },
    {
      'texto': 'Qual é a capital da França?',
      'respostas': [
        {'texto': 'Berlim', 'nota': 0},
        {'texto': 'Madrid', 'nota': 0},
        {'texto': 'Paris', 'nota': 1},
        {'texto': 'Roma', 'nota': 0},
      ],
    },
    {
      'texto': 'Qual é o menor país do mundo?',
      'respostas': [
        {'texto': 'Mônaco', 'nota': 0},
        {'texto': 'Vaticano', 'nota': 1},
        {'texto': 'Nauru', 'nota': 0},
        {'texto': 'Tuvalu', 'nota': 0},
      ],
    },
    {
      'texto': 'Qual é o maior planeta do sistema solar?',
      'respostas': [
        {'texto': 'Terra', 'nota': 0},
        {'texto': 'Marte', 'nota': 0},
        {'texto': 'Júpiter', 'nota': 1},
        {'texto': 'Saturno', 'nota': 0},
      ],
    },
    {
      'texto': 'Qual é o idioma mais falado do mundo?',
      'respostas': [
        {'texto': 'Espanhol', 'nota': 0},
        {'texto': 'Chinês Mandarim', 'nota': 1},
        {'texto': 'Inglês', 'nota': 0},
        {'texto': 'Árabe', 'nota': 0},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            color: Colors.blue,
          ),
          title: const Center(
            child: Text(
              'Perguntas',
              style: TextStyle(fontSize: 38),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: mostrandoTelaInicial
            ? TelaInicial(
                onStart: iniciarQuestionario,
              )
            : temPerguntaSelecionada
                ? Questionario(
                    perguntas: perguntas,
                    perguntaSelecionada: perguntaSelecionada,
                    responder: responder)
                : Resultado(
                    nota: notaTotal,
                    onclickReiniciar: reiniciar,
                  ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
