import 'package:app2flutter/componentes/titulos.dart';
import 'package:flutter/material.dart';
import './componentes/lista_transacao.dart';
import './modelos/transacao.dart';
import 'dart:math';
import './componentes/grafico.dart';
//a

main() => runApp(AppGestao());

class AppGestao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
      theme: ThemeData(
        fontFamily: 'Oswald',
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.black,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen,
          primary: Colors.green,
          secondary: Colors.lightGreenAccent,
        ),
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<Transacao> transacao = [];

  List<Transacao> get recentesTransacoes {
    return transacao.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  adicionarTransacao(String titulo, double valor, DateTime date) {
    final novaTransacao = Transacao(
      id: Random().nextDouble().toString(),
      title: titulo,
      value: valor,
      date: date,
    );

    setState(() {
      transacao.add(novaTransacao);
    });
    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      transacao.removeWhere((tr) => tr.id == id);
    });
  }

  _abrindoModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Titulos(adicionarTransacao);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _abrindoModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Grafico(recentesTransacoes),
            ListaTransacao(transacao, _removeTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _abrindoModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
