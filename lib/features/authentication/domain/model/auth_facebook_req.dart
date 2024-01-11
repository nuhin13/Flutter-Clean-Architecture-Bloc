class AuthFacebookReq {

  // Totally Dummy param
  final String? gmail;
  final String uniqueFacebookId;
  final String uniqueFacebookToken;

  AuthFacebookReq({
    this.gmail,
    required this.uniqueFacebookId,
    required this.uniqueFacebookToken,
  });

  Map<String, dynamic> toJson() => {
    'gmail': gmail,
    'uniqueFacebookId': uniqueFacebookId,
    'uniqueFacebookToken': uniqueFacebookToken,
  };
}
