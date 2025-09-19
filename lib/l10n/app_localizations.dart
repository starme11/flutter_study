import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko'),
  ];

  /// No description provided for @string_title_setting.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get string_title_setting;

  /// No description provided for @setting_privacy_security_title.
  ///
  /// In en, this message translates to:
  /// **'Privacy / Security'**
  String get setting_privacy_security_title;

  /// No description provided for @setting_my_device_title.
  ///
  /// In en, this message translates to:
  /// **'My devices'**
  String get setting_my_device_title;

  /// No description provided for @delivery_setting_title.
  ///
  /// In en, this message translates to:
  /// **'My delivery info'**
  String get delivery_setting_title;

  /// No description provided for @string_alarm_alert_reminder.
  ///
  /// In en, this message translates to:
  /// **'Alarm/Alert/Reminder'**
  String get string_alarm_alert_reminder;

  /// No description provided for @emergency.
  ///
  /// In en, this message translates to:
  /// **'Emergency'**
  String get emergency;

  /// No description provided for @general_setting_title.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general_setting_title;

  /// No description provided for @cs.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get cs;

  /// No description provided for @day_night_time_setting.
  ///
  /// In en, this message translates to:
  /// **'Day/Night time settings'**
  String get day_night_time_setting;

  /// No description provided for @string_sound_and_vibrate.
  ///
  /// In en, this message translates to:
  /// **'Sound and vibrate'**
  String get string_sound_and_vibrate;

  /// No description provided for @theme_setting.
  ///
  /// In en, this message translates to:
  /// **'Theme settings'**
  String get theme_setting;

  /// No description provided for @widget_setting_title.
  ///
  /// In en, this message translates to:
  /// **'Widget settings'**
  String get widget_setting_title;

  /// No description provided for @version_info_title.
  ///
  /// In en, this message translates to:
  /// **'Version info'**
  String get version_info_title;

  /// No description provided for @info_narsha.
  ///
  /// In en, this message translates to:
  /// **'Narsha Info'**
  String get info_narsha;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @notice.
  ///
  /// In en, this message translates to:
  /// **'Notice'**
  String get notice;

  /// No description provided for @terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and conditions'**
  String get terms_and_conditions;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacy_policy;

  /// No description provided for @company_info.
  ///
  /// In en, this message translates to:
  /// **'Company information'**
  String get company_info;

  /// No description provided for @string_eoflow_address_title.
  ///
  /// In en, this message translates to:
  /// **'EOFLOW address'**
  String get string_eoflow_address_title;

  /// No description provided for @string_eoflow_address_content.
  ///
  /// In en, this message translates to:
  /// **'25, Gyeongchung-daero 295beon-gil, Gonjiam-eup, Gwangju-si, Gyeonggi-do, Republic of Korea'**
  String get string_eoflow_address_content;

  /// No description provided for @string_eoflow_homepage.
  ///
  /// In en, this message translates to:
  /// **'EOFLOW homepage'**
  String get string_eoflow_homepage;

  /// No description provided for @string_eoflow_url.
  ///
  /// In en, this message translates to:
  /// **'http://www.eoflow.com'**
  String get string_eoflow_url;

  /// No description provided for @policy.
  ///
  /// In en, this message translates to:
  /// **'Policy'**
  String get policy;

  /// No description provided for @string_open_source_license.
  ///
  /// In en, this message translates to:
  /// **'Open Source License'**
  String get string_open_source_license;

  /// No description provided for @channel_name_emergency.
  ///
  /// In en, this message translates to:
  /// **'Emergency Card'**
  String get channel_name_emergency;

  /// No description provided for @emergency_card_message.
  ///
  /// In en, this message translates to:
  /// **'I am a diabetic patient. Please call the emergency number contact the nearest hospital if I passed out.'**
  String get emergency_card_message;

  /// No description provided for @string_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get string_name;

  /// No description provided for @profile_info_type_diabetes_hint.
  ///
  /// In en, this message translates to:
  /// **'Diabetes type'**
  String get profile_info_type_diabetes_hint;

  /// No description provided for @emergency_contact.
  ///
  /// In en, this message translates to:
  /// **'Emergency contacts'**
  String get emergency_contact;

  /// No description provided for @hospital_info.
  ///
  /// In en, this message translates to:
  /// **'Hospital info'**
  String get hospital_info;

  /// No description provided for @hcp.
  ///
  /// In en, this message translates to:
  /// **'HCP'**
  String get hcp;

  /// No description provided for @hospital_name.
  ///
  /// In en, this message translates to:
  /// **'Hospital name'**
  String get hospital_name;

  /// No description provided for @message_contents.
  ///
  /// In en, this message translates to:
  /// **'Message info'**
  String get message_contents;

  /// No description provided for @button_preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get button_preview;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
