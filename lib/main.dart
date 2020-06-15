import 'dart:io';
import 'package:PsicotecProyect/Pojos/User.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:PsicotecProyect/utilities/backgroundListener.dart';
import 'package:PsicotecProyect/utilities/shPreferences.dart';
import 'package:PsicotecProyect/utilities/router.dart';


String ruta = 'login';

void main() async {
  //Instanciamos  el paquete FluroRouter para disponer de las rutas por las que navegar.
  FluroRouter.setupRouter();
  //Al tratarse del void main es necesario indicarle al IDE que instancie los objetos restantes
  WidgetsFlutterBinding.ensureInitialized();

  //Comprobar si hay un usuario guardado en las preferencias para evitar mostrar el login otra vez
  bool usuarioGuardado = await ShPreferences.getLogin();


  if (usuarioGuardado)
  {
    User usuario = await ShPreferences.getUser();

    if(usuario.tipo_usuario.indexOf("admin")!=-1)
    {
      ruta = 'homePageAdminRight';
    }
    else
    {
      ruta = 'homePageUserRight';
    }
  }
  else
  {
    ruta = 'login';
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
//    if(ShPreferences.getUser() != null)
//    {
      eventoBotonVolumen();
//    }
  }

  @override
  void dispose() {
    cerrarEventosBotones();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void onDeactivate() {
    super.deactivate();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state)
  {
    print("LifecycleWatcherState#didChangeAppLifecycleState state=${state.toString()}");
    if (state == AppLifecycleState.resumed) {
      eventoBotonVolumen();
    } else if (state == AppLifecycleState.paused) {
      eventoBotonVolumen();
    } else {
      cerrarEventosBotones();
    }
  }

//  void startServiceInPlatform() async {
//    if(Platform.isAndroid){
//      var methodChannel = MethodChannel("com.retroportalstudio.messages");
//      String data = await methodChannel.invokeMethod("startService");
//      debugPrint(data);
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return AppRetainWidget(
      child: MaterialApp(
        title: 'Flutter Login UI',
        debugShowCheckedModeBanner: false,
        // Use the generator provided by Fluro package
        onGenerateRoute: FluroRouter.router.generator,
        // Determinar a que ruta tomar dependiendo de si el usuario está loggeado o no
        initialRoute: ruta,
      ),
    );
  }
}


class AppRetainWidget extends StatelessWidget {
  const AppRetainWidget({Key key, this.child}) : super(key: key);

  final Widget child;

  final _channel = const MethodChannel('com.example/app_retain');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          if (Navigator.of(context).canPop()) {
            return true;
          } else {
            _channel.invokeMethod('sendToBackground');
            return false;
          }
        } else {
          return true;
        }
      },
      child: child,
    );
  }
}
