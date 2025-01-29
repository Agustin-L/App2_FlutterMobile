import 'package:flutter/material.dart';

class Titulos extends StatefulWidget {
  final void Function(String, double) transferindo;

  Titulos(this.transferindo);

  @override
  State<Titulos> createState() => _TitulosState();
}

class _TitulosState extends State<Titulos> {
  final tituloControle = TextEditingController();

  final valorControle = TextEditingController();

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
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: valorControle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Value (R\$)',
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text('Nenhuma data selecionada!'),
                  ElevatedButton( 
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
                    child: Text('Selecionar Data',
                    style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    color: Colors.black),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final titulo = tituloControle.text;
                          final valor =
                              double.tryParse(valorControle.text) ?? 0.0;
                          widget.transferindo(titulo, valor);
                        },
                        child: Text(
                          'Nova transação',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
