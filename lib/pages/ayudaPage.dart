import 'package:flutter/material.dart';

class ayudaPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('Ayuda'),),
      body: new Column(
        children: <Widget>[
          new Text('estamos en la ayuda'),
        ],
      ),
    );
    throw UnimplementedError();
  }
}