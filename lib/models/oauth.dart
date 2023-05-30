import 'package:openuma/helpers/randomize.dart';

class OAuth {
  // Constantes extraídas de la App de Android (src/app/services/duma.service.ts)
  static const String _realm = "AppUMA";
  static const String _consumerKey = "84bc108b70bc6578a0a1c88f8a4b7131";
  static const String _consumerSecret = "5Yn9DvNwBuDrbHbX";
  static const String _signatureMethod = "PLAINTEXT";
  static const String _version = "1.0";
  late final String _nonce;
  late final String _signature;
  late final int _timestamp;
  late final String _accessToken;
  late final String _accessSecret;

  OAuth(this._accessToken, this._accessSecret) {
    _timestamp = DateTime.now().millisecondsSinceEpoch;
    _signature = '${Uri.encodeFull(_consumerSecret)}&$_accessSecret';
    _nonce = Randomize.string();
  }

  String toHeader() {
    String out = 'Oauth realm="$_realm"';
    final params = toParams();

    for (var param in params.entries) {
      out += ', ${param.key}="${param.value}"';
    }

    return out;
  }

  Map<String, String> toParams() {
    return {
      "oauth_consumer_key": _consumerKey,
      "oauth_nonce": _nonce,
      "oauth_signature": _signature,
      "oauth_signature_method": _signatureMethod,
      "oauth_timestamp": _timestamp.toString(),
      "oauth_token": _accessToken,
      "oauth_version": _version
    };
  }
}
