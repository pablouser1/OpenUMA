import 'package:http/http.dart' as http;
import 'package:openuma/models/oauth.dart';

class Api {
  final _client = http.Client();

  static const String _baseHost = "duma.uma.es";

  static const Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/111.0' // TODO: ADD PROPER USER AGENT
  };

  String _accessKey = "";
  String _accessSecret = "";

  Future<int> codigo(String id, [double ?lat, double ?lon]) async {
    final oauth = _buildAuth();
    Uri url = Uri.https(_baseHost, '/codcod/$id', oauth.toParams());
    final Map<String, String> body = {};

    if (lat != null && lon != null) {
      body["lat"] = lat.toString();
      body["lon"] = lon.toString();
    }

    final res = await _client.post(url, headers: _defaultHeaders, body: body);

    return res.statusCode;
  }

  bool isLoggedIn() => _accessKey != "" && _accessSecret != "";

  void setTokens(String accessKey, String accessSecret) {
    _accessKey = accessKey;
    _accessSecret = accessSecret;
  }

  OAuth _buildAuth() => OAuth(_accessKey, _accessSecret);
}
