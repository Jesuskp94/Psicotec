import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:PsicotecProyect/utilities/constants.dart';
import 'package:PsicotecProyect/utilities/shPreferences.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// This app is a stateful, it tracks the user's current choice.
class ContractPage extends StatefulWidget {
  @override
  _BasicAppBarSampleState createState() => _BasicAppBarSampleState();
}

class _BasicAppBarSampleState extends State<ContractPage> {
  Choice _selectedChoice = choices[0]; // The app's "state".
  bool respuesta;

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
        break;
      case 'Results':
        print('has pulsado en el botón de los resultados');
        Navigator.pushReplacementNamed(context, 'resultsRight');
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
          title: const Text('TICandBOT'),
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
            // overflow menu
            PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(3).map((Choice choice) {
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
                                child: Text('Fecha de inicio:',),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text('Fecha de finalizacion:',),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text('Logros conseguidos:',),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text('Sanciones recibidas:',),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0),

                          CircularPercentIndicator(
                            radius: 120.0,
                            lineWidth: 5.0,
                            percent: 0.2,
                            center: new Text('Horas jugando'),
                          ),
                          CircularPercentIndicator(
                            radius: 120.0,
                            lineWidth: 5.0,
                            percent: 0.8,
                            center: new Text('Tiempo restante'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildAboutDialog(context),
          );
          //TODO: añadirle la lógica para que compruebe si esa clave introducida es la clave de seguridad
        },
        backgroundColor: Colors.orange,
      ),
    );
  }


  ///Definición del widget para los popups
  Widget _buildAboutDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return new AlertDialog(
      title: const Text('Inserte su clave secreta'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAboutText(_formKey),
          //_buildLogoAttribution(),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            if(_formKey.currentState.validate()){
              Navigator.of(context).pop();
            }
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Aceptar'),

        ),
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Cancelar'),
        ),
      ],
    );
  }
  Widget _buildAboutText(GlobalKey<FormState> _formKey) {
    return new Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value){
              if (value.isEmpty) {

                return 'Clave vacia';
              }

              return null;
            },
          ),
        ],
      ),
    );
  }
}