class User {
  final int? id;
  final String? photoUrl;
  final String? photoFile;
  final String? photoData; // base64 string
  final String? username;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? displayName;
  final String? email;
  final String? role;
  final String? countryCode;
  final String? languageCode;
  final String? dateOfBirth;
  final String? gender;
  final String? diabetesType;
  final double? height;
  final double? weight;
  final String? organization;
  final String? title;
  final int? preferedUnitLength;
  final int? preferedUnitWeight;
  final int? preferedUnitBG;
  final int? preferedUnitTemperature;
  final String? statusMessage;
  final bool? registered;
  final int? isMinor;
  final bool? termsAndConditions;
  final bool? consentToCollectionAndUseRequired;
  final bool? consentToCollectionAndUseOption;
  final bool? transmissionOverseas;
  final bool? sensitiveInformationProcessing;
  final bool? provideThirdParty;
  final bool? legalRepresentative;
  final int? serviceType;
  // final List<Consent>? privacyPolicyConsents;

  User({
    this.id,
    this.photoUrl,
    this.photoFile,
    this.photoData,
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
    this.termsAndConditions,
    this.consentToCollectionAndUseRequired,
    this.consentToCollectionAndUseOption,
    this.transmissionOverseas,
    this.sensitiveInformationProcessing,
    this.provideThirdParty,
    this.legalRepresentative,
    this.serviceType,
    // this.privacyPolicyConsents,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    photoUrl: json["photoUrl"],
    photoFile: json["photoFile"],
    photoData: json["photoData"],
    username: json["username"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    displayName: json["displayName"],
    email: json["email"],
    role: json["role"],
    countryCode: json["countryCode"],
    languageCode: json["languageCode"],
    dateOfBirth: json["dateOfBirth"],
    gender: json["gender"],
    diabetesType: json["diabetesType"],
    height: double.tryParse(json["height"]),
    weight: double.tryParse(json["weight"]),
    organization: json["organization"],
    title: json["title"],
    preferedUnitLength: json["preferedUnitLength"],
    preferedUnitWeight: json["preferedUnitWeight"],
    preferedUnitBG: json["preferedUnitBG"],
    preferedUnitTemperature: json["preferedUnitTemperature"],
    statusMessage: json["statusMessage"],
    registered: json["registered"],
    isMinor: json["isMinor"],
    termsAndConditions: json["termsAndConditions"],
    consentToCollectionAndUseRequired:
        json["consentToCollectionAndUse_required"],
    consentToCollectionAndUseOption: json["consentToCollectionAndUse_option"],
    transmissionOverseas: json["transmissionOverseas"],
    sensitiveInformationProcessing: json["sensitiveInformationProcessing"],
    provideThirdParty: json["provideThirdParty"],
    legalRepresentative: json["legalRepresentative"],
    serviceType: json["serviceType"],
    // privacyPolicyConsents: json["privacyPolicyConsents"] == null
    //     ? []
    //     : List<Consent>.from(
    //         json["privacyPolicyConsents"]!.map((x) => Consent.fromJson(x)),
    //       ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "photoUrl": photoUrl,
    "photoFile": photoFile,
    "photoData": photoData,
    "username": username,
    "password": password,
    "firstName": firstName,
    "lastName": lastName,
    "displayName": displayName,
    "email": email,
    "role": role,
    "countryCode": countryCode,
    "languageCode": languageCode,
    "dateOfBirth": dateOfBirth,
    "gender": gender,
    "diabetesType": diabetesType,
    "height": height,
    "weight": weight,
    "organization": organization,
    "title": title,
    "preferedUnitLength": preferedUnitLength,
    "preferedUnitWeight": preferedUnitWeight,
    "preferedUnitBG": preferedUnitBG,
    "preferedUnitTemperature": preferedUnitTemperature,
    "statusMessage": statusMessage,
    "registered": registered,
    "isMinor": isMinor,
    "termsAndConditions": termsAndConditions,
    "consentToCollectionAndUse_required": consentToCollectionAndUseRequired,
    "consentToCollectionAndUse_option": consentToCollectionAndUseOption,
    "transmissionOverseas": transmissionOverseas,
    "sensitiveInformationProcessing": sensitiveInformationProcessing,
    "provideThirdParty": provideThirdParty,
    "legalRepresentative": legalRepresentative,
    "serviceType": serviceType,
    // "privacyPolicyConsents": privacyPolicyConsents == null
    //     ? []
    //     : List<dynamic>.from(privacyPolicyConsents!.map((x) => x.toJson())),
  };
}
