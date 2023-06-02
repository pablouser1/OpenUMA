class Notificacion {
  final String canal;
  final String canalNombre;
  final String extra;
  final String fecha;
  final String fechaOrden;
  final bool leido;
  final String mensaje;

  const Notificacion({
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
