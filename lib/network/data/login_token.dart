class LoginToken {
  final int id;
  final int status;

  final String token;
  final String created;
  final String expired;

  LoginToken({
    required this.id,
    required this.status,
    required this.token,
    required this.created,
    required this.expired,
  });

  factory LoginToken.fromJson(Map<String, dynamic> json) {
    return LoginToken(
      id: json['id'],
      status: json['status'],
      token: json['token'],
      created: json['created'],
      expired: json['expired'],
    );
  }
}
