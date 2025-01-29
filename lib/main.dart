
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

    final List <Transacao> transacao = [
       Transacao(
         id: 't0',
         title: 'conta antiga',
         value: 21.00,
         date: DateTime.now().subtract(Duration(days: 3)),
       ),
       Transacao(
         id: 't1',
         title: 'novo tenis de corridda',
         value: 361.45,
         date: DateTime.now().subtract(Duration(days: 3)),
       ),
       Transacao(
         id: 't2',
         title: 'conta luz',
         value: 31.45,
         date: DateTime.now().subtract(Duration(days: 4)),
       ),
       Transacao(
         id: 't3',
         title: 'conta internet',
         value: 161.80,
         date: DateTime.now(),
       ),Transacao(
         id: 't4',
         title: 'Petshop',
         value: 60.60,
         date: DateTime.now(),
       ),
    ];
    
    List<Transacao> get recentesTransacoes {
        return transacao.where((tr) {
          return tr.date.isAfter(DateTime.now().subtract(
            Duration(days: 7),
            ));
      }).toList();
    }

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
          Navigator.of(context).pop();
       }

      _abrindoModal(BuildContext context){
        showModalBottomSheet(
          context: context,
          builder: (_) {return Titulos(adicionarTransacao);}
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
        ListaTransacao(transacao),
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
