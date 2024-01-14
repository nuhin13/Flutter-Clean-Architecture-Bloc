class AuthLoginResponse {
  AuthLoginResponse(
      {this.accessToken,
      this.refreshToken,
      this.isSuperAdmin,
      this.userName,
      this.fullName,
      this.organizationName,
      this.customerId});

  AuthLoginResponse.fromJson(dynamic json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    isSuperAdmin = json['IsSuperAdmin'];
    userName = json['UserName'];
    fullName = json['FullName'];
    organizationName = json['OrganizationName'];
    customerId = json['CustomerId'];
  }

  String? accessToken;
  String? refreshToken;
  String? isSuperAdmin;
  String? userName;
  String? fullName;
  String? organizationName;
  String? customerId;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['access_token'] = accessToken;
    map['refresh_token'] = refreshToken;
    map['IsSuperAdmin'] = isSuperAdmin;
    map['UserName'] = userName;
    map['FullName'] = fullName;
    map['OrganizationName'] = organizationName;
    map['CustomerId'] = customerId;
    return map;
  }
}
