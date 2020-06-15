import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

//Importaciones de las páginas a las que se va a dirigir:-----------------------
//Importos generales
import '../main.dart';
import '../loginPage.dart';
import 'aplicationsList.dart';

//Importos para los usuarios
import 'package:PsicotecProyect/screens/users/homePageUser.dart';
import 'package:PsicotecProyect/screens/users/contractPageUser.dart';
import 'package:PsicotecProyect/screens/users/resultsPageUser.dart';


//Importos para los administradores
import 'package:PsicotecProyect/screens/admins/homePageAdmin.dart';
import 'package:PsicotecProyect/screens/admins/contractPageAdmin.dart';
import 'package:PsicotecProyect/screens/admins/resultsPageAdmin.dart';
import 'package:PsicotecProyect/screens/admins/settingsPageAdmin.dart';

class FluroRouter {
  static Router router = Router();

  // Handlers comunes
  static Handler _mainHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => MyApp());
  static Handler _loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => LoginPage());
  static Handler _aplicationsHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => ListAppsPages());


  // Handlers de los usuarios--------------------------------------------------------------------------------------------------------------
  static Handler _homePageUserHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => HomePageUser());
  static Handler _contractHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => ContractPageUser());
  static Handler _informationHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => ResultsPageUser());



  // Handlers de los administradores--------------------------------------------------------------------------------------------------------------
  static Handler _homePageAdminHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => HomePageAdmin());
  static Handler _contracPagetAdminHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => ContractPageAdmin());
  static Handler _resultsPageAdminnHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => ResultsPageAdmin());
  static Handler _settingsPageAdminHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => SettingsPageAdmin());


  static void setupRouter() {
    //Definicion de las rutas comunes para todos-------------------------------------------
    router.define(      'main',      handler: _mainHandler,    );

    router.define(      'login',      handler: _loginHandler,    );

    router.define(      'aplicationsRight',      handler: _aplicationsHandler,      transitionType: TransitionType.inFromRight,    );


    //Definicion de las rutas para los usuarios-------------------------------------------
    router.define(      'homePageUserRight',      handler: _homePageUserHandler,      transitionType: TransitionType.inFromRight,    );
    router.define(      'homePageUserLeft',      handler: _homePageUserHandler,      transitionType: TransitionType.inFromLeft,    );

    router.define(      'contracPageUsertRight',      handler: _contractHandler,      transitionType: TransitionType.inFromRight,    );
    router.define(      'contracPageUserLeft',      handler: _contractHandler,      transitionType: TransitionType.inFromLeft,    );

    router.define(      'resultsPageUserRight',      handler: _informationHandler,      transitionType: TransitionType.inFromRight,    );
    router.define(      'resultsPageUserLeft',      handler: _informationHandler,      transitionType: TransitionType.inFromLeft,    );



    //Definicion de las rutas para los administradores----------------------------------------
    router.define(      'homePageAdminRight',      handler: _homePageAdminHandler,      transitionType: TransitionType.inFromRight,    );
    router.define(      'homePageAdminLeft',      handler: _homePageAdminHandler,      transitionType: TransitionType.inFromLeft,    );

    router.define(      'contractPageAdminRight',      handler: _contracPagetAdminHandler,      transitionType: TransitionType.inFromRight,    );
    router.define(      'contractPageAdmintLeft',      handler: _contracPagetAdminHandler,      transitionType: TransitionType.inFromLeft,    );

    router.define(      'resultsPageAdminRight',      handler: _resultsPageAdminnHandler,      transitionType: TransitionType.inFromRight,    );
    router.define(      'resultsPageAdminLeft',      handler: _resultsPageAdminnHandler,      transitionType: TransitionType.inFromLeft,    );

    router.define(      'settingsPageAdminRight',      handler: _settingsPageAdminHandler,      transitionType: TransitionType.inFromRight,    );
    router.define(      'settingsPageAdmineft',      handler: _settingsPageAdminHandler,      transitionType: TransitionType.inFromLeft,    );

  }
}