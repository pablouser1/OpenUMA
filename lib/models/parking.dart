class Barrera {
  final String id;
  final String name;
  final double lat;
  final double lon;
  static const int range = 100;

  Barrera({
    required this.id,
    required this.name,
    required this.lat,
    required this.lon
  });
}

class Parking {
  final String name;
  final List<Barrera> barreras;

  Parking({
    required this.name,
    required this.barreras
  });
}
