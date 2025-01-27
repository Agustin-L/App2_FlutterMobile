
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../modelos/transacao.dart';

class ListaTransacao extends StatelessWidget {
  
  List<Transacao> transacao;

  ListaTransacao(this.transacao);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transacao.isEmpty ? Column(
        children: [
          Text(
            'Nenhuma trasação Cadastrada!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 20,),
          Container(
            height: 200,
            child: Image.asset('assets/images/50098.png',
            fit: BoxFit.cover,
            ),
          )
        ],
      ):
      ListView.builder(
        itemCount: transacao.length,
        itemBuilder: (ctx,index){

        final tr = transacao[index];

        return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          decoration:
                              BoxDecoration(border: Border.all(color: Colors.red)),
                          padding: EdgeInsets.all(10),
                          child: Text('R\$ ${tr.value.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr.title,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat('d MM y').format(tr.date),
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );    
                },
              ),
            );
          }
        }
