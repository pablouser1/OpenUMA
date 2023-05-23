import 'package:openuma/models/coords.dart';
import 'package:openuma/models/parking.dart';

const List<Parking> parkings = [
  Parking(
    name: "ETSI Informática",
    barreras: [
      Barrera(
        id: "dc703e26-d8a5-40a1-a11f-4275a325c44c",
        name: "Entrada",
        coords: Coords(36.71560817173959, -4.476098904797359),
        range: 150
      ),
      Barrera(
        id: "356f46c7-d2ba-4528-9aa3-4ebe785585c0",
        name: "Salida",
        coords: Coords(36.71560817173959, -4.476098904797359),
        range: 150
      ),
    ],
  ),
];
