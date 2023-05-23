import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:openuma/models/expediente.dart';
import 'package:openuma/models/oauth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  final _client = http.Client();

  static const String _baseHost = "duma.uma.es";

  static const Map<String, String> _defaultHeaders = {
    'Accept': 'application/json, text/plain, */*',
    'Accept-Encoding': 'gzip, deflate',
    'Accept-Language': 'es-ES,es;q=0.9,en-GB;q=0.8,en-US;q=0.7,en;q=0.6',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Referer': 'http://localhost',
    'User-Agent': 'Mozilla/5.0 (Linux; Android 13; POCO F1 Build/TQ2A.230505.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/113.0.5672.77 Mobile Safari/537.36', // TODO: ADD PROPER USER AGENT
    'X-Requested-With': 'es.uma.appuma'
  };

  String _accessKey = "";
  String _accessSecret = "";

  Future<List<Expediente>> expedientes() async {
    final oauth = _buildAuth();

    Uri url = Uri.https(_baseHost, '/api/appuma/misexpedientes/', oauth.toParams());

    final res = await _client.post(url, headers: _buildHeaders(oauth));

    if (res.statusCode == 200) {
      Iterable l = json.decode(res.body);
      List<Expediente> expedientes = List<Expediente>.from(l.map((model)=> Expediente.fromJson(model)));
      return expedientes;
    }

    throw Exception("Error al conseguir expedientes");
  }

  /// Enviar códigos QR / solicitudes barras de aparcamiento
  /// 
  /// Devuelve el status code de la respuesta
  Future<int> codigo(String id, [double ?lat, double ?lon]) async {
    final oauth = _buildAuth();
    Uri url = Uri.https(_baseHost, '/codcod/$id/', oauth.toParams());
    final Map<String, String> body = {};

    if (lat != null && lon != null) {
      body["lat"] = lat.toString();
      body["lon"] = lon.toString();
    }

    final res = await _client.post(url, headers: _buildHeaders(oauth), body: body);

    return res.statusCode;
  }

  // -- Helpers -- //
  bool isLoggedIn() => _accessKey != "" && _accessSecret != "";

  void setTokens(String accessKey, String accessSecret) {
    _accessKey = accessKey;
    _accessSecret = accessSecret;
  }

  void setTokensFromConfig() {
    SharedPreferences.getInstance().then((pref) {
      String? accessToken = pref.getString("accessToken");
      String? accessSecret = pref.getString("accessSecret");
      if (accessToken != null && accessSecret != null) {
        setTokens(accessToken, accessSecret);
      }
    });
  }

  // -- PRIVATE METHODS -- //
  Map<String, String> _buildHeaders(OAuth oauth) => {
    ..._defaultHeaders,
    ...{"Authentication": oauth.toHeader()},
  };

  OAuth _buildAuth() => OAuth(_accessKey, _accessSecret);
}
