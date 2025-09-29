import 'package:setting/data/preference/preference.dart';

class User extends Preference {
  @override
  String PREFERENCE_NAME = "USER";

  int? id;
  int? status;
  String? photoUrl;
  String? photoFile;
  String? username;
  String? password;
  String? firstName;
  String? lastName;
  String? displayName;
  String? email;
  String? role;
  String? countryCode;
  String? languageCode;
  String? dateOfBirth;
  String? gender;
  String? diabetesType;
  double? height;
  double? weight;
  String? organization;
  String? title;
  int? preferedUnitLength;
  int? preferedUnitWeight;
  int? preferedUnitBG;
  int? preferedUnitTemperature;
  String? statusMessage;
  bool? registered;
  bool? isMinor;
  // List<Consent>? privacyPolicyConsents;
  int? serviceType;

  User({
    this.id,
    this.status,
    this.photoUrl,
    this.photoFile,
    this.username,
    this.password,
    this.firstName,
    this.lastName,
    this.displayName,
    this.email,
    this.role,
    this.countryCode,
    this.languageCode,
    this.dateOfBirth,
    this.gender,
    this.diabetesType,
    this.height,
    this.weight,
    this.organization,
    this.title,
    this.preferedUnitLength,
    this.preferedUnitWeight,
    this.preferedUnitBG,
    this.preferedUnitTemperature,
    this.statusMessage,
    this.registered,
    this.isMinor,
    this.serviceType,
  });

  // JSON → 객체
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      status: json['status'],
      photoUrl: json['photourl'],
      photoFile: json['photoFile'],
      username: json['userName'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      displayName: json['displayName'],
      email: json['email'],
      role: json['role'],
      countryCode: json['countryCode'],
      languageCode: json['languageCode'],
      dateOfBirth: json['dateOfBirth'],
      gender: json['gender'],
      diabetesType: json['diabetesType'],
      height: json['height']?.toDouble(),
      weight: json['weight']?.toDouble(),
      organization: json['organization'],
      title: json['title'],
      preferedUnitLength: json['preferedUnitLength'],
      preferedUnitWeight: json['preferedUnitWeight'],
      preferedUnitBG: json['preferedUnitBg'],
      preferedUnitTemperature: json['preferedUnitTemperature'],
      statusMessage: json['statusMessage'],
      registered: json['registered'],
      isMinor: json['isMinor'],
      serviceType: json['serviceType'],
    );
  }

  // 객체 → JSON
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'photoUrl': photoUrl,
      'photoFile': photoFile,
      'username': username,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'displayName': displayName,
      'email': email,
      'role': role,
      'countryCode': countryCode,
      'languageCode': languageCode,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'diabetesType': diabetesType,
      'height': height,
      'weight': weight,
      'organization': organization,
      'title': title,
      'preferedUnitLength': preferedUnitLength,
      'preferedUnitWeight': preferedUnitWeight,
      'preferedUnitBG': preferedUnitBG,
      'preferedUnitTemperature': preferedUnitTemperature,
      'statusMessage': statusMessage,
      'registered': registered,
      'isMinor': isMinor,
      'serviceType': serviceType,
    };
  }

  @override
  void clear() {
    id = null;
    status = null;
    photoUrl = null;
    photoFile = null;
    username = null;
    password = null;
    firstName = null;
    lastName = null;
    displayName = null;
    email = null;
    role = null;
    countryCode = null;
    languageCode = null;
    dateOfBirth = null;
    gender = null;
    diabetesType = null;
    height = null;
    weight = null;
    organization = null;
    title = null;
    preferedUnitLength = null;
    preferedUnitWeight = null;
    preferedUnitBG = null;
    preferedUnitTemperature = null;
    statusMessage = null;
    registered = null;
    isMinor = null;
    serviceType = null;
    // privacyPolicyConsents = null;
    serviceType = null;

    appPreference.savePreference(this);
  }
}
