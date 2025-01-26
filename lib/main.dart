
import 'package:app2flutter/componentes/titulos.dart';
import 'package:flutter/material.dart';

import './componentes/lista_transacao.dart';
import './modelos/transacao.dart';
import 'dart:math';
//a
main() => runApp(AppGestao());

class AppGestao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MaterialApp(home: MyHome()));
  }
}

class MyHome extends StatefulWidget {

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  
  final transacao = [
    Transacao(
      id: 't1',
      title: 'novo tenis de corridda',
      value: 361.45,
      date: DateTime.now(),
    ),
    Transacao(
      id: 't2',
      title: 'conta luz',
      value: 31.45,
      date: DateTime.now(),
    ),
  ];
 
       adicionarTransacao(String titulo, double valor){
          final novaTransacao = Transacao(
            id: Random().nextDouble().toString(), 
            title: titulo,
            value: valor, 
            date: DateTime.now(),
          );
          setState(() {
            transacao.add(novaTransacao);
          });
        

    showModalBottomSheet(
      context: context,
      builder: (_) {return Titulos(adicionarTransacao);}
        ); 
      }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Despesas Pessoais'),
        actions: [
          IconButton(
             icon: Icon(Icons.add),
              onPressed: () {}
        
        )
       ],
      ),
      body: SingleChildScrollView(
        
        child: Column(
         
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Card(
                color: Colors.green,
                child: Center(child: Text("Grafico", style: TextStyle())),
              ),
            ),
        
          Column(
          children: [
          Titulos(adicionarTransacao),
          ListaTransacao(transacao),
          ],
         ),
        
        ],
       ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {}
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ); 
      
     }
}
