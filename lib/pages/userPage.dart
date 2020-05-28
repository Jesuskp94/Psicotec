import 'package:flutter/material.dart';

class userPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('Usuario'),),
      body: new Column(
        children: <Widget>[
          new Text('Los datos del usuario se mostrarán acá y podrá modificarlos como el desee'),
        ],
      ),
    );
    throw UnimplementedError();
  }
}