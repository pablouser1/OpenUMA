class NotifSinLeer {
  int mensajesSinLeer;

  NotifSinLeer({
    required this.mensajesSinLeer
  });

  factory NotifSinLeer.fromJson(Map<String, dynamic> json) {
    return NotifSinLeer(
      mensajesSinLeer: json['mensajes_sin_leer']
    );
  }
}
