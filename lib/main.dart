
import 'package:flutter/material.dart';
import './componentes/transacaousuario.dart';
//a
main() => runApp(AppGestao());

class AppGestao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MaterialApp(home: MyHome()));
  }
}

class MyHome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Despesas Pessoais'),
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
          
            TransacaoUsuario(),
          ],
         ),
      ),
      ); 
     }
    }
