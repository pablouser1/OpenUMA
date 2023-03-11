import 'package:flutter/material.dart';
import 'package:openuma/api.dart';

class AppState extends ChangeNotifier {
  final Api _api = Api();
  Api get api => _api;
}
