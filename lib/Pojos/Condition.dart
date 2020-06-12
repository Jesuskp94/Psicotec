class Condition
{
  String id_condicion, id_aplicacion, nombre, permitir, hora_inicio, hora_fin, id_sancion, sdescripcion, id_logro, ldescripcion;

  Condition(
      this.id_condicion,
      this.id_aplicacion,
      this.nombre,
      this.permitir,
      this.hora_inicio,
      this.hora_fin,
      this.id_sancion,
      this.sdescripcion,
      this.id_logro,
      this.ldescripcion
      );

  Condition.fromJson(Map<String, dynamic > json)
      : id_condicion = json['id_condicion'],
        id_aplicacion = json['id_aplicacion'],
        nombre = json['nombre'],
        permitir = json['permitir'],
        hora_inicio = json['hora_inicio'],
        hora_fin = json['hora_fin'],
        id_sancion = json['id_sancion'],
        sdescripcion = json['sdescripcion'],
        id_logro = json['id_logro'],
        ldescripcion = json['ldescripcion'];

  Map<String, dynamic> toJson() => {
    'id_condicion': id_condicion,
    'id_aplicacion': id_aplicacion,
    'nombre': nombre,
    'permitir': permitir,
    'hora_inicio': hora_inicio,
    'hora_fin': hora_fin,
    'id_sancion': id_sancion,
    'sdescripcion': sdescripcion,
    'id_logro': id_logro,
    'ldescripcion': ldescripcion,
  };
}