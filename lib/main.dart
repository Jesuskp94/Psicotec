import 'package:flutter/material.dart';
import 'package:time/time.dart';

void main() => runApp(MyApp()); //Más simple y legible que:
/*void main()
{
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {

    return MaterialApp(
      title: "Proyecto ANT",
      home: Scaffold(
        appBar: AppBar(
          title: Text ("Estos son tus datos"),
        ),
        body: Center(
          child: multiplicar(),
        ),
      ),
    );

  }
}

class multiplicar extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return multiplicacionNumeros();
    throw UnimplementedError();
  }
}

class multiplicacionNumeros extends State<StatefulWidget>
{
  @override
  Widget build(BuildContext context) {
    final nombre = "pepe"; //El nombre del usuario remoto de la BBDD
    final apellido = "perez"; //Sus apellidos
    return Text(nombre + " " + apellido);
    throw UnimplementedError();
  }
  
}
