class AppAuthKey {
  final String key;

  AppAuthKey({required this.key});

  factory AppAuthKey.fromJson(Map<String, dynamic> json) {
    return AppAuthKey(key: json['key']);
  }

  Map<String, dynamic> toJson() {
    return {'key': key};
  }
}

class AppAuth {
  final String status;

  AppAuth({required this.status});

  factory AppAuth.fromJson(Map<String, dynamic> json) {
    return AppAuth(status: json['status']);
  }

  Map<String, dynamic> toJson() {
    return {'status': status};
  }
}
