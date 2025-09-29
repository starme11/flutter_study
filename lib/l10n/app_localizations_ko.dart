// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get title_setting => '설정';

  @override
  String get setting_privacy_security_title => '개인 / 보안';

  @override
  String get setting_my_device_title => '나의 기기';

  @override
  String get delivery_setting_title => '나의 주입 정보';

  @override
  String get alarm_alert_reminder => '위험경고/위험주의/알림';

  @override
  String get emergency => '응급';

  @override
  String get general_setting_title => '일반';

  @override
  String get cs => '고객지원';

  @override
  String get day_night_time_setting => '낮/밤 시간 설정';

  @override
  String get sound_and_vibrate => '소리 및 진동';

  @override
  String get theme_setting => '테마 설정';

  @override
  String get widget_setting_title => '위젯 설정';

  @override
  String get version_info_title => '버전 정보';

  @override
  String get info_narsha => '나르샤 정보';

  @override
  String get help => '도움말';

  @override
  String get notice => '공지사항';

  @override
  String get terms_and_conditions => '이용 약관';

  @override
  String get privacy_policy => '개인정보 처리방침';

  @override
  String get company_info => '회사 정보';

  @override
  String get eoflow_address_title => '이오플로우 주소';

  @override
  String get eoflow_address_content => '경기도 광주시 곤지암읍\n경충대로 295번길 25';

  @override
  String get eoflow_homepage => '이오플로우 홈페이지';

  @override
  String get eoflow_url => 'http://www.eoflow.com';

  @override
  String get policy => '정책';

  @override
  String get open_source_license => '오픈 소스 라이선스';

  @override
  String get channel_name_emergency => '응급의료카드';

  @override
  String get emergency_card_message =>
      '저는 당뇨 환자입니다. 의식을 잃은 경우 119 혹은 가까운 병원에 연락해주세요.';

  @override
  String get name => '이름';

  @override
  String get profile_info_type_diabetes_hint => '당뇨타입';

  @override
  String get emergency_contact => '긴급연락처';

  @override
  String get hospital_info => '병원 정보';

  @override
  String get hcp => '의료진';

  @override
  String get hospital_name => '병원명';

  @override
  String get message_contents => '메시지 내용';

  @override
  String get button_preview => '미리보기';

  @override
  String get login_id_hint => '아이디';

  @override
  String get login_password_hint => '비밀번호';

  @override
  String get login_button => '로그인';

  @override
  String get basal_program_management => '기초주입 프로그램 관리';

  @override
  String get temp_basal_preset_management => '일시 기초주입 프리셋 관리';

  @override
  String get bolus_preset_management => '볼루스 프리셋 관리';

  @override
  String get carb_preset_management => '탄수화물 프리셋 관리';

  @override
  String get bg_target_range => '목표 혈당 범위';

  @override
  String get basal_temp_delivery => '기초/일시기초 주입';

  @override
  String get max_bolus_title => '최대 볼루스';

  @override
  String get setting_bolus_calculator => '볼루스 계산기';

  @override
  String get no_bolus_preset => '볼루스 프리셋을 추가하세요.';

  @override
  String get bolus => '볼루스';

  @override
  String get insulin => '인슐린';

  @override
  String delete_preset(Object presetName) {
    return '\'$presetName\' 프리셋을 삭제하시겠습니까?';
  }

  @override
  String get confirm => '확인';

  @override
  String get add_new => '추가';

  @override
  String get save => '저장';

  @override
  String get cancel => '취소';

  @override
  String get edit => '편집';

  @override
  String get delete => '삭제';

  @override
  String get copy => '복사';

  @override
  String get dialog_title_insulin => '인슐린 주입량';
}
