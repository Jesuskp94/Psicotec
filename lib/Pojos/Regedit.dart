class Regedit
{
  String id_registro, id_usuario, tipo_registro, descripcion, id_aplicacion, fecha_inicio, fecha_fin;

  Regedit(this.id_registro, this.id_usuario, this.tipo_registro, this.descripcion, this.id_aplicacion, this.fecha_inicio, this.fecha_fin);

  Regedit.fromJson(Map<String, dynamic > json)
      : id_registro = json['id_registro'],
        id_usuario = json['id_usuario'],
        tipo_registro = json['tipo_registro'],
        descripcion = json['descripcion'],
        id_aplicacion = json['id_aplicacion'],
        fecha_inicio = json['fecha_inicio'],
        fecha_fin = json['fecha_fin'];

  Map<String, dynamic> toJson() => {
    'id_registro': id_registro,
    'id_usuario': id_usuario,
    'tipo_registro': tipo_registro,
    'descripcion': descripcion,
    'id_aplicacion': id_aplicacion,
    'fecha_inicio': fecha_inicio,
    'fecha_fin': fecha_fin,
  };
}