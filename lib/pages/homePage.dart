import 'package:flutter/material.dart';

class homePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('pagina del home'),
      ),
      body: new Column(
        children: <Widget>[
          new Text('estamos en el home'),
        ],
      ),
    );
    throw UnimplementedError();
  }
}