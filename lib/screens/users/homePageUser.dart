import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:PsicotecProyect/utilities/constants.dart';
import 'package:PsicotecProyect/utilities/shPreferences.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../utilities/aplicationsList.dart';

// This app is a stateful, it tracks the user's current choice.
class HomePageUser extends StatefulWidget {
  @override
  _HomePageUser createState() => _HomePageUser();
}

class _HomePageUser extends State<HomePageUser> with WidgetsBindingObserver {
  Choice _selectedChoice = choices[0]; // The app's "state".

  ///Que ocurre cuando pulsamos alguno de los botones del appbar
  ///
  void _select(Choice choice)
  {
    switch (choice.title)
    {
      case 'Home':
        print('has pulsado en el botón del home');
        break;
      case 'Contract':
        print('has pulsado en el botón del contrato');
        Navigator.pushReplacementNamed(context, 'contracPageUsertRight');
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

    //Se le asigna el state para que vuelva a cargar la página desde el build
    setState(() {
      _selectedChoice = choice;
    });
  }


  ///build de la pantalla principal
  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Psicotec'),
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(choices[0].icon),
              onPressed: () {
                _select(choices[0]);
              },
            ),
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
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
  //TODO:implementar lo necesario para que en vez de volver a cargar una nueva página me recargue los datos de la choice actu
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

  int horasPantallaActiva()
  {
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text('Tiempo libre actividad:',),
                            ),
                            Expanded(
                              child: Text("tiempo numeros",),
                            ),
                          ],
                        ),
                        kDividers,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularPercentIndicator(
                              radius: 130.0,
                              lineWidth: 5.0,
                              percent: 0.2,
                              center: new Text('Horas jugando'),
                              footer: new Text(horasPantallaActiva().toString()),
                              progressColor: Colors.blue,
                            ),
                            CircularPercentIndicator(
                              radius: 130.0,
                              lineWidth: 5.0,
                              percent: 0.8,
                              center: new Text('Tiempo restante'),
                              footer: new Text(horasPantallaActiva().toString()),
                              progressColor: Colors.blue,
                            ),
                          ],
                        ),
                        kDividers,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            LinearPercentIndicator(
                              width: 170.0,
                              animation: true,
                              animationDuration: 1000,
                              lineHeight: 20.0, //TODO:crear algoritmo que permita determinar el porcentaje del proyecto realizado
                              leading: new Text("Progreso del contrato"),
                              percent: 0.2,
                              center: Text("20.0%"),
                              linearStrokeCap: LinearStrokeCap.butt,
                              progressColor: Colors.blue,
                            ),

                          ],
                        ),
                        kDividers,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            LinearPercentIndicator(
                              width: 170.0,
                              animation: true,
                              animationDuration: 1000,
                              lineHeight: 20.0,
                              leading: new Text("Progreso del contrato"),
                              percent: 0.2,
                              center: Text("20.0%"),
                              linearStrokeCap: LinearStrokeCap.butt,
                              progressColor: Colors.blue,
                            ),

                          ],
                        ),
                        kDividers,
                        Center(
                          child: RaisedButton(
                            onPressed: ()
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ListAppsPages()),
                              );
//                            pruebaStart();
                            },
                            child: const Text('Aplicaciones', style: TextStyle(fontSize: 20)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}