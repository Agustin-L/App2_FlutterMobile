import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Titulos extends StatefulWidget {
  final void Function(String, double, DateTime) transferindo;

  Titulos(this.transferindo);

  @override
  State<Titulos> createState() => _TitulosState();
}

class _TitulosState extends State<Titulos> {
  final _tituloControle = TextEditingController();
  final valorControle = TextEditingController();
  DateTime _selecDate = DateTime.now();

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime.now(),
    ).then((pickDate) {
      if (pickDate == null) {
        return;
      }
      setState(() {
        _selecDate = pickDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            ),
          child: Column(
            children: [
              TextField(
                controller: _tituloControle,
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
                    Expanded(
                      child: Text(
                        _selecDate == null
                            ? 'Nenhuma data selecionada!'
                            : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selecDate)}',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _showDatePicker,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
                      child: Text(
                        'Selecionar Data',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            final titulo = _tituloControle.text;
                            final valor = double.tryParse(valorControle.text) ?? 0.0;
                           
                            widget.transferindo(titulo, valor, _selecDate);
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
      ),
    );
  }
}
