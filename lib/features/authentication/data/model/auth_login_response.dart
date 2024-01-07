class AuthLoginResponse {
  AuthLoginResponse({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.refreshToken,
    this.issued,
    this.expires,
    this.isSuperAdmin,
    this.userId,
    this.userName,
    this.fullName,
    this.isOwner,
    this.timeZone,
    this.organizationId,
    this.organizationName,
    this.isMaster,
    this.connectionString,
    this.customerId,
    this.isOrganizationOnTrail,
    this.isOrganizationOnTrailNExpired,
    this.isOrganizationOverdue,
    this.isOrganizationDue,
    this.isCanUseSMSGateway,
    this.isCanAccessBkashPGW,});

  AuthLoginResponse.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    refreshToken = json['refresh_token'];
    issued = json['.issued'];
    expires = json['.expires'];
    isSuperAdmin = json['IsSuperAdmin'];
    userId = json['UserId'];
    userName = json['UserName'];
    fullName = json['FullName'];
    isOwner = json['IsOwner'];
    timeZone = json['TimeZone'];
    organizationId = json['OrganizationId'];
    organizationName = json['OrganizationName'];
    isMaster = json['IsMaster'];
    connectionString = json['ConnectionString'];
    customerId = json['CustomerId'];
    isOrganizationOnTrail = json['IsOrganizationOnTrail'];
    isOrganizationOnTrailNExpired = json['IsOrganizationOnTrailNExpired'];
    isOrganizationOverdue = json['IsOrganizationOverdue'];
    isOrganizationDue = json['IsOrganizationDue'];
    isCanUseSMSGateway = json['IsCanUseSMSGateway'];
    isCanAccessBkashPGW = json['IsCanAccessBkashPGW'];
  }

  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? refreshToken;
  String? issued;
  String? expires;
  String? isSuperAdmin;
  String? userId;
  String? userName;
  String? fullName;
  String? isOwner;
  String? timeZone;
  String? organizationId;
  String? organizationName;
  String? isMaster;
  String? connectionString;
  String? customerId;
  String? isOrganizationOnTrail;
  String? isOrganizationOnTrailNExpired;
  String? isOrganizationOverdue;
  String? isOrganizationDue;
  String? isCanUseSMSGateway;
  String? isCanAccessBkashPGW;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    map['refresh_token'] = refreshToken;
    map['.issued'] = issued;
    map['.expires'] = expires;
    map['IsSuperAdmin'] = isSuperAdmin;
    map['UserId'] = userId;
    map['UserName'] = userName;
    map['FullName'] = fullName;
    map['IsOwner'] = isOwner;
    map['TimeZone'] = timeZone;
    map['OrganizationId'] = organizationId;
    map['OrganizationName'] = organizationName;
    map['IsMaster'] = isMaster;
    map['ConnectionString?'] = connectionString;
    map['CustomerId'] = customerId;
    map['IsOrganizationOnTrail'] = isOrganizationOnTrail;
    map['IsOrganizationOnTrailNExpired'] = isOrganizationOnTrailNExpired;
    map['IsOrganizationOverdue'] = isOrganizationOverdue;
    map['IsOrganizationDue'] = isOrganizationDue;
    map['IsCanUseSMSGateway'] = isCanUseSMSGateway;
    map['IsCanAccessBkashPGW'] = isCanAccessBkashPGW;
    return map;
  }

}