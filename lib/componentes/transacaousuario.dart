
import 'dart:math';
import 'package:flutter/material.dart';
import './titulos.dart';
import './lista_transacao.dart';
import '../modelos/transacao.dart';

class TransacaoUsuario extends StatefulWidget {
  

  @override
  _TrancasaoStatus createState() => _TrancasaoStatus();
}

class _TrancasaoStatus extends State<TransacaoUsuario> {
  
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
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Titulos(adicionarTransacao),
        ListaTransacao(transacao),
        
      ],
    );
  }
}