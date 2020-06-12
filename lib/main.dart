import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterappbeginning/pages/homePage.dart';
import 'package:flutterappbeginning/pages/userPage.dart';
import 'package:http/http.dart' as http;

void main() => runApp(LoginApp()); //Más simple y legible que:

String username = '';

class User
{
  final String email;
  final String contrasena;

  User({this.email, this.contrasena});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String,
      contrasena: json['contrasena'] as String,
    );
  }
}


class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto ANT',
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/homePage': (BuildContext context) => new homePage(),
        '/userPage': (BuildContext context) => new userPage(),
      },
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  String mensaje = '';

  Future<Map<String, dynamic>> _login() async
  {
    final direccionemulador = "http://192.168.1.45/api/login.php";
    //final direccionServidorRemoto = "http://192.168.1.45/api/login.php";

    final response = await http.post(direccionemulador, body: {
      "email": controllerUser.text,
      "contrasena": controllerPass.text,
    });

    Map<String, dynamic> user = jsonDecode(response.body);

    var datauser = json.decode(response.body);

    //List<User> users = (json.decode(response.body) as List).map((i) => User.fromJson(i)).toList(); //List<User>.from(datauser).map((Map model)=> User.fromJson(model)).toList();

    if (datauser['mensaje'].toString().compareTo('error')==-1)
    {

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => homePage()),
      );

      //print(user['email'].toString());
      setState(() {
        mensaje = datauser['email'].toString() + datauser['contrasena'].toString();
      });
    }
    else
    {
      print(user['mensaje'].compareTo('error'));
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/fondo.jpg"),
              fit: BoxFit.cover
            ),
          ),
          child: Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top:77.0),
                child: new CircleAvatar(
                  backgroundColor: Color(0xF81F7F3),
                  child: new Image(
                    width: 135,
                    height: 135,
                    image: new AssetImage('assets/images/miniatura.jpg'),
                  ),
                ),
                width: 170.0,
                height: 170.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height /2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  top: 93
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color:Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5
                          )
                        ]
                      ),
                      child: TextFormField(
                        controller: controllerUser,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width /1.2,
                      height: 50,
                      margin: EdgeInsets.only(
                        top: 32
                      ),
                      padding: EdgeInsets.only(
                        top: 4, left: 16, right: 16, bottom: 4
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: TextField(
                        controller: controllerPass,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.black,
                          ),
                          hintText: 'Contraseña'
                        )
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 6,right: 32,
                        ),
                        child: Text(
                          'Recordar Contraseña',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    new RaisedButton(
                      child: new Text('Entrar'),
                      color: Colors.orangeAccent,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)
                      ),
                      onPressed: (){
                        _login();
                        //Navigator.pop(context, mensaje);
                      },
                    ),
                    Text(mensaje,
                    style: TextStyle(fontSize: 25.0, color: Colors.red),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

