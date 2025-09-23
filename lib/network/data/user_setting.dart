class UserSetting {
  final int? id;
  final int? messageFilter;
  final int? bufferTimeoutSeconds;
  final int? soundMode;
  final int? use24HourTime;
  final int? startMorningHour;
  final int? startAfternoonHour;
  final int? startEveningHour;
  final int? startSleepingHour;
  final int? syncToServerHour;
  final int? registered;
  final int? lastUpdated;

  UserSetting({
    this.id,
    this.messageFilter,
    this.bufferTimeoutSeconds,
    this.soundMode,
    this.use24HourTime,
    this.startMorningHour,
    this.startAfternoonHour,
    this.startEveningHour,
    this.startSleepingHour,
    this.syncToServerHour,
    this.registered,
    this.lastUpdated,
  });

  factory UserSetting.fromJson(Map<String, dynamic> json) => UserSetting(
    id: json["id"],
    messageFilter: json["messageFilter"],
    bufferTimeoutSeconds: json["bufferTimeoutSeconds"],
    soundMode: json["soundMode"],
    use24HourTime: json["use24HourTime"],
    startMorningHour: json["startMorningHour"],
    startAfternoonHour: json["startAfternoonHour"],
    startEveningHour: json["startEveningHour"],
    startSleepingHour: json["startSleepingHour"],
    syncToServerHour: json["syncToServerHour"],
    registered: json["registered"],
    lastUpdated: json["lastUpdated"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "messageFilter": messageFilter,
    "bufferTimeoutSeconds": bufferTimeoutSeconds,
    "soundMode": soundMode,
    "use24HourTime": use24HourTime,
    "startMorningHour": startMorningHour,
    "startAfternoonHour": startAfternoonHour,
    "startEveningHour": startEveningHour,
    "startSleepingHour": startSleepingHour,
    "syncToServerHour": syncToServerHour,
    "registered": registered,
    "lastUpdated": lastUpdated,
  };
}
