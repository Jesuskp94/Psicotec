import 'package:PsicotecProyect/Pojos/Contract.dart';
import 'package:PsicotecProyect/utilities/apiCalls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:PsicotecProyect/utilities/shPreferences.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// This app is a stateful, it tracks the user's current choice.
class ContractPageUser extends StatefulWidget {
  @override
  _ContractPageUser createState() => _ContractPageUser();
}

class _ContractPageUser extends State<ContractPageUser> {
  Choice _selectedChoice = choices[0]; // The app's "state".
  bool respuesta;

  void solicitarDatos() async
  {
    await solicitarContrato(ShPreferences.usuario.id_usuario);
    await solicitarCondiciones(ShPreferences.contrato.id_contrato);
    await solicitarRegistros(ShPreferences.usuario.id_usuario);
  }


  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    switch (choice.title)
    {
      case 'Home':
        print('has pulsado en el botón del home');
        Navigator.pushReplacementNamed(context, 'homePageUserLeft');
        break;
      case 'Contract':
        print('has pulsado en el botón del contrato');
        break;
      case 'Results':
        print('has pulsado en el botón de los resultados');
        Navigator.pushReplacementNamed(context, 'resultsPageUserRight');
        break;
      case 'Logout':
        showAboutDialog(
          context: context,
          applicationName: 'Psico',
          children: [
            SizedBox(
              child: Text('Inserta la contraseña para poder salir'),
              //TODO:implementar la lógica para comprobar la contraseña que solo el admin sabe
            ),
          ],
        );

        ShPreferences.setLogin(null);
        ShPreferences.setUser(null);
        ShPreferences.setContract(null);
        ShPreferences.setContractConditions(null);
        print('has pulsado en el botón de desconectarte');
        Navigator.pushReplacementNamed(context, 'login');
        break;
    }

    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    solicitarDatos();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Psicotec'),
          backgroundColor: Colors.green,
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(choices[0].icon),
              onPressed: () {
                _select(choices[0]);
              },
            ),
            // action button
            IconButton(
              icon: Icon(choices[1].icon),
              onPressed: () {
                _select(choices[1]);
              },
            ),
            IconButton(
              icon: Icon(choices[2].icon),
              onPressed: () {
                _select(choices[2]);
              },
            ),
//            IconButton(
//              icon: Icon(choices[3].icon),
//              onPressed: () {
//                _select(choices[3]);
//              },
//            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ChoiceCard(choice: _selectedChoice),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Home', icon: Icons.home),
  const Choice(title: 'Contract', icon: Icons.assignment),
//  const Choice(title: 'Results', icon: Icons.assessment),
  const Choice(title: 'Logout', icon: Icons.settings_power),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;
  static final showGrid = true;



  ///Definición de la listView
  int calcularHorasTotales()
  {
    int contador=0;

    DateTime inicio  = DateTime.tryParse(ShPreferences.contrato.fecha_inicio);
    DateTime fin  = DateTime.tryParse(ShPreferences.contrato.fecha_fin);

    while (inicio.compareTo(fin) <= 0)
    {
      inicio = inicio.add(new Duration(hours: 1));
      contador++;
    }

    return contador;
  }

  int calcularTiempoTranscurrido()
  {
    DateTime hoy = DateTime.now();
    DateTime inicio  = DateTime.tryParse(ShPreferences.contrato.fecha_inicio);


    int contadorTiempoTranscurrido=0;

    while (inicio.compareTo(hoy) <= 0)
    {
      inicio = inicio.add(new Duration(hours: 1));
      contadorTiempoTranscurrido++;
    }

    return contadorTiempoTranscurrido;
  }

  int calcularTiempoRestante()
  {
    DateTime hoy = DateTime.now();
    DateTime fin  = DateTime.tryParse(ShPreferences.contrato.fecha_fin);

    int contadorTiempoRestante=0;

    while(hoy.compareTo(fin) <= 0)
    {
      hoy = hoy.add(new Duration(hours: 1));
      contadorTiempoRestante++;
    }

    return contadorTiempoRestante;
  }

  double calcularPorcentaje()
  {
    int horasTotales = calcularHorasTotales();
    int tiempoTranscurrido = calcularTiempoTranscurrido();

    double calculo = ((100*tiempoTranscurrido)/horasTotales/100);

    return calculo;

  }

  Widget _buildList() => ListView(
    children: [
      _tile('Fecha de creación del contrato', ShPreferences.contrato.fecha_inicio, Icons.date_range),
      _tile('Fecha de finalización', ShPreferences.contrato.fecha_fin, Icons.update),
      _tile('Logros conseguidos', ShPreferences.contrato.logros_conseguidos, Icons.star),
      _tile('Sanciones recibidas', ShPreferences.contrato.sanciones_recibidas, Icons.star_border),
      _tile('Condiciones impuestas', ShPreferences.contrato.listaCondiciones.length.toString(), Icons.account_balance_wallet),
      CircularPercentIndicator(
        radius: 150.0,
        lineWidth: 5.0,
        percent: calcularPorcentaje(),
        center: new Text('Tiempo restante: ' + calcularTiempoRestante().toString() + 'h'),
        footer: new Text(calcularHorasTotales().toString() + ' horas en total'),
        progressColor: Colors.green[500],
      ),
    ],
  );

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _buildList()),
    );
  }


}