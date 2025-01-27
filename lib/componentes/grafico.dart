import 'package:app2flutter/modelos/transacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Grafico extends StatelessWidget {

  final List<Transacao> recentesTransacoes;

  Grafico(this.recentesTransacoes);
  
  List<Map<String, Object>> get grupoDeTransacao {
    return List.generate(7, (index){
      final diaSemana = DateTime.now().subtract(
        Duration(days: index),
        );
      
      double totalS = 0.0;

      for(var i = 0; i < recentesTransacoes.length; i++){
      
       bool dia = recentesTransacoes[i].date.day == diaSemana.day;
       bool mes = recentesTransacoes[i].date.month == diaSemana.month;
       bool ano = recentesTransacoes[i].date.year == diaSemana.year;
      
        if(dia && mes && ano){
          totalS += recentesTransacoes[i].value;
        }
      }
        
      print(DateFormat.E().format(diaSemana)[0]);
      print(totalS);

      return {
      'day': DateFormat.E().format(diaSemana)[0], 
      'value': totalS,
      };
    });
  }

   @override
  Widget build(BuildContext context) {
    grupoDeTransacao;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}