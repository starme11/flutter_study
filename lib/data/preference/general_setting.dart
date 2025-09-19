class GeneralSetting {
  // Generate a v8 (time-random) id
  String deviceId; //= Uuid().v8();
  String baseUrl;

  GeneralSetting({required this.deviceId, required this.baseUrl});

  factory GeneralSetting.fromJson(Map<String, dynamic> json) {
    return GeneralSetting(deviceId: json["deviceId"], baseUrl: json["baseUrl"]);
  }

  Map<String, dynamic> toJson() {
    return {"deviceId": deviceId, "baseUrl": baseUrl};
  }
}
