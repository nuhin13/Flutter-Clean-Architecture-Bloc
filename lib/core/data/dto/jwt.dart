import 'dart:convert';

class JWT {
  final String _token;
  final String _refreshToken;

  JWT(this._token, this._refreshToken);

  @override
  String toString() {
    return _token;
  }

  String getRefreshToken() {
    return _refreshToken;
  }

  String getToken() {
    return _token;
  }

  Map<String, dynamic> payload() {
    final parts = _token.split('.');
    if (parts.length != 3) {
      throw const FormatException('Invalid token.');
    }

    final payload = json.decode(_decodeBase64(parts[1]));
    if (payload is! Map<String, dynamic>) {
      throw const FormatException('Invalid payload.');
    }

    return payload;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += "==";
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64 string.');
    }

    return utf8.decode(base64Url.decode(output));
  }

  bool isAlive() {
    return !isExpired();
  }

  bool isExpired() {
    final DateTime? expirationDate = getExpiryDate();
    if (expirationDate == null) return false;

    return DateTime.now().isAfter(expirationDate);
  }

  DateTime? getExpiryDate() {
    final Map<String, dynamic> payload = this.payload();
    if (payload['exp'] == null) return null;

    return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).add(Duration(seconds: payload["exp"]));
  }
}
