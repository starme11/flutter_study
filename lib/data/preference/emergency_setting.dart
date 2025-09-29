import 'package:setting/data/preference/preference.dart';

class EmergencySetting extends Preference {
  @override
  String PREFERENCE_NAME = "EMERGENCY_SETTING";

  bool useEmergencyCard;
  List<String> contact;
  String? hospital;
  String? doctor;
  String? message;

  EmergencySetting({
    required this.useEmergencyCard,
    required this.contact,
    this.hospital,
    this.doctor,
    this.message,
  });

  // JSON → 객체
  factory EmergencySetting.fromJson(Map<String, dynamic> json) {
    return EmergencySetting(
      useEmergencyCard: json['useEmergencyCard'],
      contact: List<String>.from(json['contact']),
      hospital: json['hospital'],
      doctor: json['doctor'],
      message: json['message'],
    );
  }

  // 객체 → JSON
  @override
  Map<String, dynamic> toJson() {
    return {
      'useEmergencyCard': useEmergencyCard,
      'contact': contact,
      'hospital': hospital,
      'doctor': doctor,
      'message': message,
    };
  }

  @override
  void clear() {
    useEmergencyCard = false;
    contact = [" ", " ", " "];
    hospital = null;
    doctor = null;
    message = null;

    appPreference.savePreference(this);
  }
}
