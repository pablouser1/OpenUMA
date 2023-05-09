import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:openuma/models/expediente.dart';
import 'package:openuma/models/oauth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  final _client = http.Client();

  static const String _baseHost = "duma.uma.es";

  static const Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/111.0' // TODO: ADD PROPER USER AGENT
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
