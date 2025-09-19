class EmergencySetting {
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
  Map<String, dynamic> toJson() {
    return {
      'useEmergencyCard': useEmergencyCard,
      'contact': contact,
      'hospital': hospital,
      'doctor': doctor,
      'message': message,
    };
  }
}
