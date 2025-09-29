import 'package:setting/data/preference/app_preference.dart';
import 'package:setting/service/service_locator.dart';

abstract class Preference {
  AppPreference get appPreference => ServiceLocator.instance.appPreference;

  String get PREFERENCE_NAME;

  Map<String, dynamic> toJson();

  void clear();
}
