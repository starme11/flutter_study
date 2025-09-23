import 'package:setting/data/preference/app_preference.dart';
import 'package:setting/data/preference/preference.dart';

class LogInToken implements Preference {
  @override
  String PREFERENCE_NAME = "LOG_IN_TOKEN";

  int? pid;

  String? token;
  String? created;
  String? expired;

  LogInToken({
    required this.pid,
    required this.token,
    required this.created,
    required this.expired,
  });

  factory LogInToken.fromJson(Map<String, dynamic> json) {
    return LogInToken(
      pid: json['pid'],
      token: json['token'],
      created: json['created'],
      expired: json['expired'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {'pid': pid, 'token': token, 'created': created, 'expired': expired};
  }

  @override
  void clear() {
    pid = null;
    token = null;
    created = null;
    expired = null;

    AppPreference.savePreference(this);
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
