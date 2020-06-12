import 'package:flutter/material.dart';
import 'package:PsicotecProyect/Pojos/Contract.dart';
import 'package:PsicotecProyect/utilities/shPreferences.dart';
import 'package:PsicotecProyect/utilities/router.dart';

import 'Pojos/User.dart';

String ruta = 'login';

Future<void> main() async {
  //Instanciamos  el paquete FluroRouter para disponer de las rutas por las que navegar.
  FluroRouter.setupRouter();
  //Al tratarse del void main es necesario indicarle al IDE que instancie los objetos restantes
  WidgetsFlutterBinding.ensureInitialized();

  //Comprobar si hay un usuario guardado en las preferencias para evitar mostrar el login otra vez
  bool usuarioGuardado = await ShPreferences.getLogin();

  if (usuarioGuardado)
  {
    User usuario = await ShPreferences.getUser();
    print(usuario.email);
    Contract contrato = await ShPreferences.getContract();
    print(contrato.objetivo);

    ruta = 'homeRight';
  }
  else
  {
    ruta = 'login';
  }

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      // Use the generator provided by Fluro package
      onGenerateRoute: FluroRouter.router.generator,
      // Determinar a que ruta tomar dependiendo de si el usuario está loggeado o no
      initialRoute: ruta,
    );
  }
}