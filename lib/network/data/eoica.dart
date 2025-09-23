class Eoica {
  final int? id;
  final String? deviceId;
  final String? swVersion;
  final int? os;
  final int? model;

  Eoica({this.id, this.deviceId, this.swVersion, this.os, this.model});

  factory Eoica.fromJson(Map<String, dynamic> json) {
    return Eoica(
      id: json['id'],
      deviceId: json['deviceId'],
      swVersion: json['swVersion'],
      os: json['os'],
      model: json['model'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deviceId': deviceId,
      'swVersion': swVersion,
      'os': os,
      'model': model,
    };
  }
}
