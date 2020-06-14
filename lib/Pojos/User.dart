import 'package:PsicotecProyect/Pojos/Regedit.dart';

class User
{
  String id_usuario, email, contrasenia, nombre, apellidos, DNI, telefono, tipo_usuario;

  User(this.id_usuario, this.email, this.contrasenia, this.nombre, this.apellidos, this.DNI, this.telefono, tipo_usuario);

  List<Regedit> listaRegistros;

  User.fromJson(Map<String, dynamic > json)
      : id_usuario = json['id_usuario'],
        email = json['email'],
        contrasenia = json['contrasenia'],
        nombre = json['nombre'],
        apellidos = json['apellidos'],
        DNI = json['DNI'],
        telefono = json['telefono'],
        tipo_usuario = json['tipo_usuario'];

  Map<String, dynamic> toJson() => {
    'id_usuario': id_usuario,
    'email': email,
    'contrasenia': contrasenia,
    'nombre': nombre,
    'apellidos': apellidos,
    'DNI': DNI,
    'telefono': telefono,
    'tipo_usuario':tipo_usuario,
  };
}