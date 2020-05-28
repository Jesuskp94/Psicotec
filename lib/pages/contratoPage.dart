import 'package:flutter/material.dart';

class contratoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('Contrato'),),
      body: new Column(
        children: <Widget>[
          new Text('página donde se mostrarán los datos del contrato'),
        ],
      ),
    );
    throw UnimplementedError();
  }
}