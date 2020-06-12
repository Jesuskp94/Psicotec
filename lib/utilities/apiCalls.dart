import 'package:PsicotecProyect/Pojos/Condition.dart';
import 'package:PsicotecProyect/Pojos/Contract.dart';
import 'package:PsicotecProyect/Pojos/User.dart';
import 'package:PsicotecProyect/utilities/shPreferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

final rutaLogin = "http://192.168.1.45/api/apiUsuario/login.php";
final rutaContrato = "http://192.168.1.45/api/apiContrato/contrato.php";
final rutaCondicion = "http://192.168.1.45/api/apiContrato/condiciones_contrato.php";
final rutaRegistro = "http://192.168.1.45/api/apiContrato/condiciones_contrato.php";


///Nos indica si el usuario y la contraseña introducidos son correctos
///
///Tener encuenta que es un proceso asyncrono por lo que requiere de un await que espere su finalización.
Future<User> solicitarUsuario(String email, String contrasenia) async
{
  final response = await http.post(rutaLogin, body: {
    "email": email,
    "contrasenia": contrasenia,
  });

  var dataUser = json.decode(response.body) as Map<String, dynamic>;
  var error = dataUser.containsKey('mensaje');

  if (!error)
  {
    ///Guardamos el usuario en las preferencias para un posterior uso.
    try
    {
      User user = User.fromJson(dataUser);
      await ShPreferences.setUser(user);

      return user;
    }
    catch (Excepetion)
    {
      print('exception user error');
      return null;
    }
  }
  return null;
}




///Nos indica si el usuario y la contraseña introducidos son correctos
///
///Tener encuenta que es un proceso asyncrono por lo que requiere de un await que espere su finalización.
Future<Contract> solicitarContrato(String idUsuario) async
{
  final response = await http.post(rutaContrato, body: {
    "id_usuario": idUsuario,
  });

  var dataContract = json.decode(response.body) as Map<String, dynamic>;
  var error = dataContract.containsKey('mensaje');

  if (!error)
  {
    try
    {
      Contract contrato = Contract.fromJson(dataContract);
      ShPreferences.setContract(contrato);

      return contrato;
    }
    catch (Excepetion)
    {
      print('exception contract error');
      return null;
    }
  }
  return null;
}




///Nos indica si el usuario y la contraseña introducidos son correctos
///
///Tener encuenta que es un proceso asyncrono por lo que requiere de un await que espere su finalización.
Future<bool> solicitarCondiciones(String idContrato) async
{
  final response = await http.post(rutaCondicion, body: {
    "id_contrato": idContrato,
  });
  var dataConditions = json.decode(response.body);

  var error = dataConditions.toString().indexOf('mensaje')!=-1;

  if (!error)
  {
    List<Condition> condiciones = new List(dataConditions.length);

    for(int contador = 0; contador<dataConditions.length; contador++)
    {
      condiciones[contador] = Condition.fromJson(dataConditions[contador]);
    }

    //Modificamos el contrato que se tiene guardado en las sharedPreferences
    Contract contrato = await ShPreferences.getContract();
    contrato.listaCondiciones = condiciones;
    ShPreferences.setContract(contrato);

    return true;
  }
  return false;
}



///Nos indica si el usuario y la contraseña introducidos son correctos
///
///Tener encuenta que es un proceso asyncrono por lo que requiere de un await que espere su finalización.
Future<bool> solicitarRegistros(String id_usuario) async
{
  final response = await http.post(rutaCondicion, body: {
    "id_usuario": id_usuario,
  });
  var dataRegedeits = json.decode(response.body);

  var error = dataRegedeits.toString().indexOf('mensaje')!=-1;

  if (!error)
  {
    //TODO: adquirir y guardar los registros de nuestro usuario al empezar la aplicacion
    /*List<Condition> condiciones = new List(dataConditions.length);

    for(int contador = 0; contador<dataConditions.length; contador++)
    {
      condiciones[contador] = Condition.fromJson(dataConditions[contador]);
    }

    //Modificamos el contrato que se tiene guardado en las sharedPreferences
    Contract contrato = await ShPreferences.getContract();
    contrato.listaCondiciones = condiciones;
    ShPreferences.setContract(contrato);*/

    return true;
  }
  return false;
}