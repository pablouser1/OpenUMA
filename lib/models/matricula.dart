class Matricula {
  final String asiguma;
  final String codEstadoAsig;
  final String codPlan;
  final String cursoAcad;
  final String cAsig;
  final String descripcionEstado;
  final String grupo;
  final String nombreAsig;
  final String nombreCentro;
  final String titulacion;

  const Matricula({
    required this.asiguma,
    required this.codEstadoAsig,
    required this.codPlan,
    required this.cursoAcad,
    required this.cAsig,
    required this.descripcionEstado,
    required this.grupo,
    required this.nombreAsig,
    required this.nombreCentro,
    required this.titulacion
  });

  factory Matricula.fromJson(Map<String, dynamic> json) {
    return Matricula(
      asiguma: json['ASIGUMA'],
      codEstadoAsig: json['COD_ESTADO_ASIG'],
      codPlan: json['COD_PLAN'],
      cursoAcad: json['CURSO_ACAD'],
      cAsig: json['C_ASIG'],
      descripcionEstado: json['DESCRIPCION_ESTADO'],
      grupo: json['GRUPO'],
      nombreAsig: json['NOMBRE_ASIG'],
      nombreCentro: json['NOMBRE_CENTRO'],
      titulacion: json['TITULACION']
    );
  }
}
