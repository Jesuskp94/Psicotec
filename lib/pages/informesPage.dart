import 'package:flutter/material.dart';

class informesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('Informes'),),
      body: new Column(
        children: <Widget>[
          new Text('estamos en la página de informes (intentar tomar los informes de powerBI)'),
        ],
      ),
    );
    throw UnimplementedError();
  }
}