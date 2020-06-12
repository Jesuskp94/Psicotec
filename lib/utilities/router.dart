import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

//Importaciones de las páginas a las que se va a dirigir:
import 'package:PsicotecProyect/screens/contractPage.dart';
import 'package:PsicotecProyect/screens/homePage.dart';
import 'package:PsicotecProyect/screens/resultsPage.dart';
import 'package:PsicotecProyect/screens/loginPage.dart';

class FluroRouter {
  static Router router = Router();

  // Handler for Login Page
  static Handler _loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => LoginPage());

  // Handler for Home Page
  static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => HomePage());

  // Handler for Contract Page
  static Handler _contractHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => ContractPage());

  // Handler for Results Page
  static Handler _informationHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => ResultsPage());


  static void setupRouter() {
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
  }
}