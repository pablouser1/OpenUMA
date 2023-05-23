import 'package:openuma/models/coords.dart';

class Barrera {
  final String id;
  final String name;
  final Coords coords;
  final int range;

  const Barrera({
    required this.id,
    required this.name,
    required this.coords,
    required this.range
  });
}

class Parking {
  final String name;
  final List<Barrera> barreras;

  const Parking({
    required this.name,
    required this.barreras
  });
}
