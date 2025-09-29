import 'package:setting/data/preference/preference.dart';

class SignInToken extends Preference {
  @override
  String PREFERENCE_NAME = "SIGN_IN_TOKEN";

  int? id;
  int? status;

  String? token;
  String? created;
  String? expired;

  SignInToken({
    required this.id,
    required this.status,
    required this.token,
    required this.created,
    required this.expired,
  });

  factory SignInToken.fromJson(Map<String, dynamic> json) {
    return SignInToken(
      id: json['id'],
      status: json['status'],
      token: json['token'],
      created: json['created'],
      expired: json['expired'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'token': token,
      'created': created,
      'expired': expired,
    };
  }

  @override
  void clear() {
    id = null;
    status = null;
    token = null;
    created = null;
    expired = null;

    appPreference.savePreference(this);
  }

  bool isValid() {
    if (token?.isNotEmpty == true && expired?.isNotEmpty == true) {
      DateTime now = DateTime.now().toUtc();
      DateTime expiryDate = DateTime.parse(expired!).toUtc();
      return now.isBefore(expiryDate);
    } else {
      return false;
    }
  }
}
