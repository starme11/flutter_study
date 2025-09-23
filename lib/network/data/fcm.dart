class Fcm {
  final int? id;
  final String? deviceToken;

  Fcm({this.id, this.deviceToken});

  factory Fcm.fromJson(Map<String, dynamic> json) {
    return Fcm(id: json['id'], deviceToken: json['deviceToken']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'deviceToken': deviceToken};
  }
}
