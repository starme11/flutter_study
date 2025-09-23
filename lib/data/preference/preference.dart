abstract interface class Preference {
  String get PREFERENCE_NAME;

  Map<String, dynamic> toJson();

  void clear();
}
