import 'package:PsicotecProyect/Pojos/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:PsicotecProyect/utilities/constants.dart';
import 'package:PsicotecProyect/utilities/shPreferences.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'aplicationsList.dart';

int contador = 0;


// This app is a stateful, it tracks the user's current choice.
class UserPage extends StatefulWidget {
  @override
  _UserPage createState() => _UserPage();
}

class _UserPage extends State<UserPage> with WidgetsBindingObserver {
  Choice _selectedChoice = choices[0]; // The app's "state".

//  AppLifecycleState _lastLifecyleState;

  ///Que ocurre cuando pulsamos alguno de los botones del appbar
  ///
  void _select(Choice choice)
  {
    switch (choice.title)
    {
      case 'Home':
        print('has pulsado en el botón del home');
        Navigator.pushReplacementNamed(context, 'homeLeft');
        break;
      case 'Contract':
        print('has pulsado en el botón del contrato');
        Navigator.pushReplacementNamed(context, 'contractLeft');
        break;
      case 'Results':
        print('has pulsado en el botón de los resultados');
        Navigator.pushReplacementNamed(context, 'resultsLeft');
        break;
      case 'User':
        print('has pulsado en el botón de la configuración del usuario');
        break;
      case 'About':
        print('has pulsado en el botón de la ayuda');
        showAboutDialog(
          context: context,
          applicationName: 'Psico',
          applicationVersion: '1.0.0',
          children: [
            SizedBox(
              child: Text('Mensaje para el usuario indicandole la ayuda que se le puede proveer'),
            ),
          ],
        );
        break;
      case 'Logout':
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
            IconButton(
              icon: Icon(choices[3].icon),
              onPressed: () {
                _select(choices[3]);
              },
            ),
            // overflow menu
            PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(4).map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
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

}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Home', icon: Icons.home),
  const Choice(title: 'Contract', icon: Icons.assignment),
  const Choice(title: 'Results', icon: Icons.assessment),
  const Choice(title: 'User', icon: Icons.person),
  const Choice(title: 'About', icon: Icons.help),
  const Choice(title: 'Logout', icon: Icons.settings_power),
];


class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;


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
                              child: Text('Nombre',),
                            ),
                            Expanded(
                              child: Text(ShPreferences.usuario.nombre,),
                            ),
                          ],
                        ),
                        kDividers,
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text('Apellidos',),
                            ),
                            Expanded(
                              child: Text(ShPreferences.usuario.apellidos,),
                            ),
                          ],
                        ),
                        kDividers,
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text('Email',),
                            ),
                            Expanded(
                              child: Text(ShPreferences.usuario.email,),
                            ),
                          ],
                        ),
                        kDividers,
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text('Telefono',),
                            ),
                            Expanded(
                              child: Text(ShPreferences.usuario.telefono,),
                            ),
                          ],
                        ),
                        kDividers,
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text('DNI',),
                            ),
                            Expanded(
                              child: Text(ShPreferences.usuario.DNI,),
                            ),
                          ],
                        ),
                        kDividers,



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