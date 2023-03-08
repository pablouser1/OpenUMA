import 'package:http/http.dart' as http;

class Api {
  final _client = http.Client();

  static const String baseUrl = "";

  bool isLoggedIn() {
    return false;
  }
}
