import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:setting/data/db/repository/repository_manager.dart';
import 'package:setting/data/preference/app_preference.dart';
import 'package:setting/data/preference/general_setting.dart';
import 'package:setting/l10n/app_localizations.dart';
import 'package:setting/network/api_service.dart';
import 'package:setting/network/data/base_url.dart';
import 'package:setting/objectbox.g.dart';
import 'package:setting/screens/login_screen.dart';
import 'package:setting/screens/setting_screen.dart';
import 'package:setting/service/service_locator.dart';
import 'package:setting/theme_provider.dart';

BaseUrl baseUrl = ApiService.getServiceUrl() as BaseUrl;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = await openStore();
  final repositoryManager = RepositoryManager(store);

  AppPreference appPreference = AppPreference();
  await appPreference.initPreference();

  ServiceLocator.instance.registerRepositoryManager(repositoryManager);
  ServiceLocator.instance.registerAppPreference(appPreference);

  GeneralSetting setting = appPreference.getGeneralSetting();
  BaseUrl baseUrl = await ApiService.getServiceUrl();
  setting.baseUrl = baseUrl.baseUrl;

  appPreference.savePreference(setting);

  await Firebase.initializeApp(); // Initialize Firebase
  await FirebaseRemoteConfig.instance.fetchAndActivate(); // Get Remote Config
  if (Platform.isIOS) {
    NotificationSettings settings = await FirebaseMessaging.instance
        .requestPermission(alert: true, badge: true, sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();

      while (apnsToken == null) {
        await Future.delayed(const Duration(seconds: 1));
        apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      }
    }
  }
  await FirebaseMessaging.instance.getToken(); // Get FCM Token

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const SettingApp(),
    ),
  );
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
        fontFamily: "NotoSansCJKKR",
        // 다른 라이트 모드 위젯 스타일 정의
      ),
      darkTheme: ThemeData(
        // 다크 모드 테마
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        fontFamily: "NotoSansCJKKR",
      ),
      home: Container(
        color: themeProvider.isDarkMode() ? Colors.black : Colors.white,
        child: ServiceLocator.instance.appPreference.getLogInToken().isValid()
            ? SettingScreen()
            : LoginScreen(),
      ),
    );
  }
}
