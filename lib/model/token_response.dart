class TokenResponse {
  TokenResponse({
      String? tokenType,
      int? expiresIn,
      int? extExpiresIn,
      String? accessToken,}){
    _tokenType = tokenType;
    _expiresIn = expiresIn;
    _extExpiresIn = extExpiresIn;
    _accessToken = accessToken;
}

  TokenResponse.fromJson(dynamic json) {
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
    _extExpiresIn = json['ext_expires_in'];
    _accessToken = json['access_token'];
  }
  late String? _tokenType;
  late int? _expiresIn;
  late int? _extExpiresIn;
  late String? _accessToken;

  String? get tokenType => _tokenType;
  int? get expiresIn => _expiresIn;
  int? get extExpiresIn => _extExpiresIn;
  String? get accessToken => _accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token_type'] = _tokenType;
    map['expires_in'] = _expiresIn;
    map['ext_expires_in'] = _extExpiresIn;
    map['access_token'] = _accessToken;
    return map;
  }

}