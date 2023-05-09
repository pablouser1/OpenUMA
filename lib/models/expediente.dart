class Expediente {
  String numExpediente;
  String codExpediente;
  String titulacion;
  String codCentro;
  String fechaApertura;
  String nombreCentro;
  String fechaCierre;

  Expediente({
    required this.numExpediente,
    required this.codExpediente,
    required this.titulacion,
    required this.codCentro,
    required this.fechaApertura,
    required this.nombreCentro,
    required this.fechaCierre
  });

  factory Expediente.fromJson(Map<String, dynamic> json) {
    return Expediente(
      numExpediente: json['numExpediente'],
      codExpediente: json['codExpediente'],
      titulacion: json['titulacion'],
      codCentro: json['codCentro'],
      fechaApertura: json['fechaApertura'],
      nombreCentro: json['nombreCentro'],
      fechaCierre: json['fechaCierre']
    );
  }
}
