class User {
  int? id;
  int? status;
  String? firstName;
  String? lastName;
  String? userName;
  String? displayName;
  String? diabetesType;

  User({
    this.id,
    this.status,
    this.firstName,
    this.lastName,
    this.userName,
    this.displayName,
    this.diabetesType,
  });

  // JSON → 객체
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      status: json['contact'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['userName'],
      displayName: json["displayName"],
      diabetesType: json["diabetesType"],
    );
  }

  // 객체 → JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'displayName': displayName,
      'diabetesType': diabetesType,
    };
  }
}
