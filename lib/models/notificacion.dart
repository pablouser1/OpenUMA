class Notificacion {
  String canal;
  String canalNombre;
  String extra;
  String fecha;
  String fechaOrden;
  bool leido;
  String mensaje;

  Notificacion({
    required this.canal,
    required this.canalNombre,
    required this.extra,
    required this.fecha,
    required this.fechaOrden,
    required this.leido,
    required this.mensaje
  });

  factory Notificacion.fromJson(Map<String, dynamic> json) {
    return Notificacion(
      canal: json['canal'],
      canalNombre:
      json['canal_nombre'],
      extra: json['extra'],
      fecha: json['fecha'],
      fechaOrden: json['fecha_orden'],
      leido: json['leido'],
      mensaje: json['mensaje']
    );
  }
}
