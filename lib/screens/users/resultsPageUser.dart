import 'package:flutter/material.dart';
import 'package:PsicotecProyect/utilities/shPreferences.dart';

// This app is a stateful, it tracks the user's current choice.
class ResultsPageUser extends StatefulWidget {
  @override
  _ResultsPageUser createState() => _ResultsPageUser();
}

class _ResultsPageUser extends State<ResultsPageUser> {
  Choice _selectedChoice = choices[0]; // The app's "state".

  TextEditingController controllerPassword = new TextEditingController();

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
        Navigator.pushReplacementNamed(context, 'contracPageUserLeft');
        break;
      case 'Results':
        print('has pulsado en el botón de los resultados');
        break;
      case 'Logout':
        showAboutDialog(
          context: context,
          applicationName: 'Psico',
          children: [
            SizedBox(
              child: TextFormField(
                controller: controllerPassword,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  hintText: 'Introduce tu contraseña',
                ),
              ),
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
            // action buttons
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