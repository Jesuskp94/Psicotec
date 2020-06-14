import 'package:flutter/material.dart';
import 'package:PsicotecProyect/utilities/shPreferences.dart';

// This app is a stateful, it tracks the user's current choice.
class ResultsPage extends StatefulWidget {
  @override
  _BasicAppBarSampleState createState() => _BasicAppBarSampleState();
}

class _BasicAppBarSampleState extends State<ResultsPage> {
  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
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
        break;
      case 'User':
        print('has pulsado en el botón de la configuración del usuario');
        Navigator.pushReplacementNamed(context, 'userPageRight');
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
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
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
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .headline4;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text('Pantalla de resultados', style: textStyle),
          ],
        ),
      ),
    );
  }
}