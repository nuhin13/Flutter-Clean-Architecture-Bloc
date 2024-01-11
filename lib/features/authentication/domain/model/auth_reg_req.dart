class AuthRegistrationReq {
  final String email;
  final String password;
  final String name;
  final String phone;

  AuthRegistrationReq(
      {required this.email,
      required this.password,
      required this.name,
      required this.phone});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
      };
}
