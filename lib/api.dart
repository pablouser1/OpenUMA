import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:openuma/exceptions/apiexception.dart';
import 'package:openuma/models/coords.dart';
import 'package:openuma/models/expediente.dart';
import 'package:openuma/models/matricula.dart';
import 'package:openuma/models/nota.dart';
import 'package:openuma/models/notificacion.dart';
import 'package:openuma/models/notifsinleer.dart';
import 'package:openuma/models/oauth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  final _client = http.Client();

  static const utf8 = Utf8Decoder();

  static const String _baseHost = "duma.uma.es";

  static const Map<String, String> _defaultHeaders = {
    'Accept': 'application/json, text/plain, */*',
    'Accept-Encoding': 'gzip, deflate',
    'Accept-Language': 'es-ES,es;q=0.9,en-GB;q=0.8,en-US;q=0.7,en;q=0.6',
    'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
    'Referer': 'http://localhost',
    'User-Agent':
        'Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.60 Mobile Safari/537.36',
    'X-Requested-With': 'es.uma.appuma'
  };

  String _accessKey = "";
  String _accessSecret = "";

  Future<int> notifSinLeer() async {
    final oauth = _buildAuth();
    Uri url = Uri.https(
        _baseHost, '/api/appuma/mensajes/usuario/sinleer/', oauth.toParams());

    final res = await _client.post(url, headers: _buildHeaders(oauth));

    if (res.statusCode == 200) {
      final notifs = NotifSinLeer.fromJson(_decodeUtf8Json(res));
      return notifs.mensajesSinLeer;
    }

    throw ApiException(res.statusCode, "Error al conseguir notificaciones");
  }

  Future<List<Notificacion>> notificaciones() async {
    final oauth = _buildAuth();
    Uri url =
        Uri.https(_baseHost, '/api/appuma/mensajes/usuario/', oauth.toParams());

    final res = await _client.post(url, headers: _buildHeaders(oauth));

    if (res.statusCode == 200) {
      Iterable l = _decodeUtf8Json(res);
      List<Notificacion> notificaciones = List<Notificacion>.from(
          l.map((model) => Notificacion.fromJson(model)));
      return notificaciones;
    }

    throw ApiException(res.statusCode, "Error al conseguir notificaciones");
  }

  Future<List<Expediente>> expedientes() async {
    final oauth = _buildAuth();
    Uri url =
        Uri.https(_baseHost, '/api/appuma/misexpedientes/', oauth.toParams());

    final res = await _client.post(url, headers: _buildHeaders(oauth));

    if (res.statusCode == 200) {
      Iterable l = _decodeUtf8Json(res);
      List<Expediente> expedientes =
          List<Expediente>.from(l.map((model) => Expediente.fromJson(model)));
      return expedientes;
    }

    throw ApiException(res.statusCode, "Error al conseguir expedientes");
  }

  Future<List<Matricula>> matricula() async {
    final oauth = _buildAuth();
    Uri url = Uri.https(_baseHost, '/api/appuma/matricula/', oauth.toParams());

    final res = await _client.post(url, headers: _buildHeaders(oauth));

    if (res.statusCode == 200) {
      Iterable l = _decodeUtf8Json(res);
      List<Matricula> matriculas =
          List<Matricula>.from(l.map((model) => Matricula.fromJson(model)));
      return matriculas;
    }

    throw ApiException(res.statusCode, "Error al conseguir matrícula");
  }

  Future<List<Nota>> notas(String numero, String codigo) async {
    final oauth = _buildAuth();
    Uri url =
        Uri.https(_baseHost, '/api/appuma/miexpediente/', oauth.toParams());

    final res = await _client.post(url,
        headers: _buildHeaders(oauth),
        body: {"numero": numero, "codigo": codigo});

    if (res.statusCode == 200) {
      Iterable l = _decodeUtf8Json(res);
      List<Nota> notas =
          List<Nota>.from(l.map((model) => Nota.fromJson(model)));
      return notas;
    }

    throw ApiException(res.statusCode, "Error al conseguir notas");
  }

  /// Enviar códigos QR / solicitudes barras de aparcamiento
  ///
  /// Devuelve el status code de la respuesta
  Future<int> codigo(String id, {Coords? coords}) async {
    final oauth = _buildAuth();
    Uri url = Uri.https(_baseHost, '/codcod/$id', oauth.toParams());
    final Map<String, String> body = {};

    if (coords != null) {
      body["lat"] = coords.lat.toString();
      body["lon"] = coords.lon.toString();
    }

    final res =
        await _client.post(url, headers: _buildHeaders(oauth), body: body);

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

  dynamic _decodeUtf8Json(http.Response res) {
    return jsonDecode(utf8.convert(res.bodyBytes));
  }

  OAuth _buildAuth() => OAuth(_accessKey, _accessSecret);
}
