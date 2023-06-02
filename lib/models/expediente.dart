class Expediente {
  final String numExpediente;
  final String codExpediente;
  final String titulacion;
  final String codCentro;
  final String fechaApertura;
  final String nombreCentro;
  final String fechaCierre;

  const Expediente({
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
