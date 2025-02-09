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
  bool _showChart = false;

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
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
          fontSize: 20 * MediaQuery.of(context).textScaler.scale(1),
        ),
      ),
      actions: [
        if(isLandscape)
         IconButton(
          icon: Icon(_showChart ? Icons.list : Icons.pie_chart),
          onPressed: () {
            setState(() {
              _showChart = !_showChart;
            });
         
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _abrindoModal(context),
        )
       
      ],
    );

    final availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           
           if (_showChart || !isLandscape)
              Container(
                height: availableHeight * (isLandscape ? 0.7 : 0.25),
                child: Grafico(recentesTransacoes),
              ),
            Container(
              height: availableHeight * 0.75,
              child: ListaTransacao(transacao, _removeTransaction),
            ),
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
