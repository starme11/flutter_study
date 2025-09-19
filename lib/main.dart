import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:setting/data/preference/general_setting.dart';
import 'package:setting/l10n/app_localizations.dart';
import 'package:setting/network/api_service.dart';
import 'package:setting/network/data/baseUrl.dart';
import 'package:setting/screens/setting_screen.dart';
import 'package:setting/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

BaseUrl baseUrl = ApiService.getServiceUrl() as BaseUrl;

Future<void> main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const SettingApp(),
    ),
  );

  await Firebase.initializeApp(); // Initialize Firebase
  await FirebaseRemoteConfig.instance.fetchAndActivate(); // Get Remote Config

  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? generalSetting = prefs.getString("GENERAL_SETTING");
  if (generalSetting != null) {
    GeneralSetting setting = GeneralSetting.fromJson(
      jsonDecode(generalSetting),
    );
    BaseUrl baseUrl = await ApiService.getServiceUrl();
    setting.baseUrl = baseUrl.baseUrl;

    setting.toJson();
    prefs.setString("GENERAL_SETTING", jsonEncode(setting.toJson()));
  } else {
    // 최초 사용 - UUID Random 생성
    GeneralSetting setting = GeneralSetting(deviceId: Uuid().v8(), baseUrl: "");
    prefs.setString("GENERAL_SETTING", jsonEncode(setting.toJson()));
    BaseUrl baseUrl = await ApiService.getServiceUrl();
    setting.baseUrl = baseUrl.baseUrl;

    prefs.setString("GENERAL_SETTING", jsonEncode(setting.toJson()));
  }
}

class SettingApp extends StatefulWidget {
  const SettingApp({super.key});

  @override
  State<SettingApp> createState() => _SettingAppState();
}

class _SettingAppState extends State<SettingApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Setting',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // 영어
        Locale('ko'), // 한국어
      ],
      themeMode: themeProvider.flutterThemeMode,
      theme: ThemeData(
        // 라이트 모드 테마
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        // 다른 라이트 모드 위젯 스타일 정의
      ),
      darkTheme: ThemeData(
        // 다크 모드 테마
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: const SettingScreen(),
    );
  }
}
