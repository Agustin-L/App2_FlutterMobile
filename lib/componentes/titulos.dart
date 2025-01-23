import 'package:flutter/material.dart';



class Titulos extends StatelessWidget {

    final tituloControle = TextEditingController();
    final valorControle = TextEditingController();
 
  final void Function(String,double) transferindo;

  Titulos(this.transferindo);

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: tituloControle,
                  decoration: InputDecoration(
                    labelText: 'Titulo'
                  ),
                ),
                TextField(
                  controller: valorControle,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Value (R\$)',
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed:(){
                      final titulo = tituloControle.text;
                      final valor = double.tryParse(valorControle.text) ?? 0.0;
                      transferindo(titulo,valor);

                      },
                      child: Text('Nova transação', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(
                      backgroundColor:WidgetStatePropertyAll(Colors.lightGreenAccent),
                 ),
                ),
               ],
              ),
             ],
            ),
           ),
          );
         }
        }