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
      title: "Comenzando",
      home: Scaffold(
        appBar: AppBar(
          title: Text ("Bienvenido a primeraApp"),
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
    final numero = 3;
    DateTime minutos = DateTime.now() + Duration(hours: 4);
    int multiplicacion = numero + minutos.millisecond;
    return Text(multiplicacion.toString());
    throw UnimplementedError();
  }
  
}
