import 'package:PsicotecProyect/Pojos/Regedit.dart';

class User
{
  String id_usuario, email, contrasenia, nombre, apellidos, DNI, telefono;

  User(this.id_usuario, this.email, this.contrasenia, this.nombre, this.apellidos, this.DNI, this.telefono);

  List<Regedit> listaRegistros;

  User.fromJson(Map<String, dynamic > json)
      : id_usuario = json['id_usuario'],
        email = json['email'],
        contrasenia = json['contrasenia'],
        nombre = json['nombre'],
        apellidos = json['apellidos'],
        DNI = json['DNI'],
        telefono = json['telefono'];

  Map<String, dynamic> toJson() => {
    'id_usuario': id_usuario,
    'email': email,
    'contrasenia': contrasenia,
    'nombre': nombre,
    'apellidos': apellidos,
    'DNI': DNI,
    'telefono': telefono,
  };
}