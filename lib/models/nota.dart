class Nota {
  String curso;
  List<Dato> datos;

  Nota({
    required this.curso,
    required this.datos,
  });

  factory Nota.fromJson(Map<String, dynamic> json) {
    return Nota(
      curso: json['curso'],
      datos: List<Dato>.from(json['datos'].map((model)=> Dato.fromJson(model)))
    );
  }
}

class Dato {
  String cursoAcad;
  String? calificacion;
  String aprobado;
  bool tieneNota;
  String? calificacionAlfa;
  bool esNotaParcial;
  String convocatoria;
  String nombre;
  String grupo;
  String codigoConvo;
  String anotacion;
  String? nota;
  String? notaMedia;
  String? nombreCol;

  Dato({
    required this.cursoAcad,
    required this.calificacion,
    required this.aprobado,
    required this.tieneNota,
    required this.calificacionAlfa,
    required this.esNotaParcial,
    required this.convocatoria,
    required this.nombre,
    required this.grupo,
    required this.codigoConvo,
    required this.anotacion,
    required this.nota,
    required this.notaMedia,
    required this.nombreCol,
  });

  factory Dato.fromJson(Map<String, dynamic> json) {
    return Dato(
      cursoAcad: json['cursoAcad'],
      calificacion: json['calificacion'],
      aprobado: json['aprobado'],
      tieneNota: json['tiene_nota'],
      calificacionAlfa: json['calificacionAlfa'],
      esNotaParcial: json['es_nota_parcial'],
      convocatoria: json['convocatoria'],
      nombre: json['nombre'],
      grupo: json['grupo'],
      codigoConvo: json['codigoConvo'],
      anotacion: json['anotacion'],
      nota: json['nota'],
      notaMedia: json['notaMedia'],
      nombreCol: json['nombreCol']
    );
  }
}
