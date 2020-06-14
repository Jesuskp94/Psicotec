import 'dart:convert';
import 'package:PsicotecProyect/Pojos/Condition.dart';
import 'package:PsicotecProyect/Pojos/Contract.dart';
import 'package:PsicotecProyect/Pojos/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShPreferences {
  ///
  /// Instanciación de la libreria SharedPreferences
  ///
  static final String _kLogin = 'log';
  static final String _kUser = 'usuario';
  static final String _kContract = 'contrato';
  static final String _kCondition = 'condicion';
  static final String _kRegedit = 'registro';


  //Geter y seter para saber si hay un usuario guardado o no
  static Future<bool> getLogin() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.get(_kLogin) != null)
    {
      return true;
    }
    return false;
  }
  static Future<bool> setLogin(bool value) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_kLogin, value);
  }




  //Geter y seter del usuario guardado en las SharedPreferences
  static Future<User> getUser() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return new User.fromJson(json.decode(prefs.getString(_kUser)) as Map<String, dynamic>);
  }
  static Future<bool> setUser(User value) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kUser, json.encode(value)) ?? null;
  }




  //Geter y seter del contrato guardado en las SharedPreferences
  static Future<Contract> getContract() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return new Contract.fromJson(json.decode(prefs.getString(_kContract)) as Map<String, dynamic>);
  }
  static Future<bool> setContract(Contract value) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kContract, json.encode(value)) ?? null;
  }




  //Geter y seter del contrato guardado en las SharedPreferences
  static Future<Condition> getContractConditions() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return new Condition.fromJson(json.decode(prefs.getString(_kCondition)) as Map<String, dynamic>);
  }
  static Future<bool> setContractConditions(Condition value) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kCondition, json.encode(value)) ?? null;
  }



//TODO: Crear los getters y setters de las sharedpreferences para los registros de nuestro usuario
//Geter y seter del contrato guardado en las SharedPreferences
/*static Future<Regedit> getRegedit() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return new Condition.fromJson(json.decode(prefs.getString(_kCondition)) as Map<String, dynamic>);
  }
  static Future<bool> setContractConditions(value) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kCondition, json.encode(value));
  }*/



}