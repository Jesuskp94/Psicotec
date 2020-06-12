import 'package:PsicotecProyect/Pojos/Condition.dart';

class Contract
{
//  DateTime fecha_inicio, fecha_fin;
  String id_contrato, id_usuario, logros_conseguidos, sanciones_recibidas, objetivo, fecha_inicio, fecha_fin;

  List<Condition> listaCondiciones;

  Contract(this.id_contrato, this.id_usuario, this.fecha_inicio, this.fecha_fin, this.logros_conseguidos, this.sanciones_recibidas, this.objetivo);

  Contract.fromJson(Map<String, dynamic > json)
      : id_contrato = json['id_contrato'],
        id_usuario = json['id_usuario'],
        fecha_inicio = json['fecha_inicio'],
        fecha_fin = json['fecha_fin'],
//        fecha_inicio = DateTime.tryParse(json['fecha_inicio']),
//        fecha_fin = DateTime.tryParse(json['fecha_fin']),
        logros_conseguidos = json['logros_conseguidos'],
        sanciones_recibidas = json['sanciones_recibidas'],
        objetivo = json['objetivo'];

  Map<String, dynamic> toJson() => {
    'id_contrato': id_contrato,
    'id_usuario': id_usuario,
    'fecha_inicio': fecha_inicio,
    'fecha_fin': fecha_fin,
    'logros_conseguidos': logros_conseguidos,
    'sanciones_recibidas': sanciones_recibidas,
    'objetivo': objetivo,
  };
}