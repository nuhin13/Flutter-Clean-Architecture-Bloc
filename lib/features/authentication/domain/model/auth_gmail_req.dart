class AuthGmailReq {
  // Totally Dummy param
  final String gmail;
  final String uniqueId;

  AuthGmailReq({
    required this.gmail,
    required this.uniqueId,
  });

  Map<String, dynamic> toJson() => {
        'gmail': gmail,
        'uniqueId': uniqueId,
      };
}
