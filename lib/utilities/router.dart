import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

//Importaciones de las páginas a las que se va a dirigir:
import 'package:PsicotecProyect/screens/contractPage.dart';
import 'package:PsicotecProyect/screens/homePage.dart';
import 'package:PsicotecProyect/screens/resultsPage.dart';
import 'package:PsicotecProyect/screens/loginPage.dart';
import 'package:PsicotecProyect/screens/userPage.dart';
import 'package:PsicotecProyect/screens/aplicationsList.dart';
import '../main.dart';

class FluroRouter {
  static Router router = Router();

  // Handler for the main
  static Handler _mainHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => MyApp());

  // Handler for Login Page
  static Handler _loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => LoginPage());

  // Handler for Home Page
  static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => HomePage());

  // Handler for Contract Page
  static Handler _contractHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => ContractPage());

  // Handler for Results Page
  static Handler _informationHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => ResultsPage());

  // Handler for User Page
  static Handler _userPageHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => UserPage());

  // Handler for appsList
  static Handler _aplicationsHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => ListAppsPages());


  static void setupRouter() {
    router.define(
      'main',
      handler: _mainHandler,
    );

    router.define(
      'login',
      handler: _loginHandler,
    );

    router.define(
      'homeRight',
      handler: _homeHandler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(
      'homeLeft',
      handler: _homeHandler,
      transitionType: TransitionType.inFromLeft,
    );

    router.define(
      'contractRight',
      handler: _contractHandler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(
      'contractLeft',
      handler: _contractHandler,
      transitionType: TransitionType.inFromLeft,
    );

    router.define(
      'resultsRight',
      handler: _informationHandler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(
      'resultsLeft',
      handler: _informationHandler,
      transitionType: TransitionType.inFromLeft,
    );

    router.define(
      'userPageRight',
      handler: _userPageHandler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(
      'userPageLeft',
      handler: _userPageHandler,
      transitionType: TransitionType.inFromLeft,
    );

    router.define(
      'aplicationsRight',
      handler: _aplicationsHandler,
      transitionType: TransitionType.inFromRight,
    );
  }
}