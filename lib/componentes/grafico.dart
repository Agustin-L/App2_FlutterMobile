import 'package:app2flutter/componentes/barraGrafico.dart';
import 'package:app2flutter/modelos/transacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'barraGrafico.dart';

class Grafico extends StatelessWidget {
  final List<Transacao> recentesTransacoes;

  Grafico(this.recentesTransacoes);

  List<Map<String, Object>> get grupoDeTransacao {
    return List.generate(7, (index) {
      final diaSemana = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalS = 0.0;

      for (var i = 0; i < recentesTransacoes.length; i++) {
        bool dia = recentesTransacoes[i].date.day == diaSemana.day;
        bool mes = recentesTransacoes[i].date.month == diaSemana.month;
        bool ano = recentesTransacoes[i].date.year == diaSemana.year;

        if (dia && mes && ano) {
          totalS += recentesTransacoes[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(diaSemana)[0],
        'value': totalS,
      };
    });
  }

  double get valorTotalSemana {
    return grupoDeTransacao.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    grupoDeTransacao;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: grupoDeTransacao.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: BarraGrafico(
                tr['day'].toString(),
                tr['value'] as double,
                (tr['value'] as double) / valorTotalSemana,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
