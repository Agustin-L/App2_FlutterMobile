import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../modelos/transacao.dart';

class ListaTransacao extends StatelessWidget {
  List<Transacao> transacao;
  final void Function(String) onRemove;
  
  ListaTransacao(this.transacao, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transacao.isEmpty
        ? LayoutBuilder(
        builder: (ctx, constraints){
          return Column(
            children: [
              SizedBox(height: constraints.maxHeight * 0.05),
              Container(
                height: constraints.maxHeight * 0.3,
                child: Text(
                  'Nenhuma trasação Cadastrada!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/50098.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          );
        }
        )
        : ListView.builder(
            itemCount: transacao.length,
            itemBuilder: (ctx, index) {
              final tr = transacao[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('R\$${tr.value}'),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      //style: Theme.of(context),
                    ),
                    subtitle: Text(
                      DateFormat('d MM y').format(tr.date),
                    ),
                    trailing: IconButton(
                      onPressed: () => onRemove (tr.id),
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).colorScheme.error,
                    )),
              );
            },
          );
  }
}
