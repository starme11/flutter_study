import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/data/preference/app_preference.dart';
import 'package:setting/data/preference/general_setting.dart';
import 'package:setting/data/preference/log_in_token.dart';
import 'package:setting/data/preference/sign_in_token.dart';
import 'package:setting/data/preference/user.dart';
import 'package:setting/l10n/app_localizations.dart';
import 'package:setting/network/api_service.dart';
import 'package:setting/network/authentication_service.dart';
import 'package:setting/network/data/eoica.dart';
import 'package:setting/network/data/fcm.dart';
import 'package:setting/network/eoica_service.dart';
import 'package:setting/network/fcm_service.dart';
import 'package:setting/network/setting_service.dart';
import 'package:setting/network/user_service.dart';
import 'package:setting/screens/setting_screen.dart';
import 'package:setting/service/service_locator.dart';
import 'package:setting/theme_provider.dart';
import 'package:setting/utils/common_util.dart';
import 'package:setting/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AppPreference appPreference = ServiceLocator.instance.appPreference;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;
  String? mLoginToken;

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 63),
            Image(image: AssetImage('assets/images/imgNarshaLogo01.png')),
            SizedBox(height: 59),
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: _idController.text.isNotEmpty
                    ? localizations.login_id_hint
                    : "",
                labelStyle: TextStyle(
                  color: Color.fromRGBO(189, 189, 189, 1),
                  fontSize: 13,
                  fontFamily: "NotoSansCJKKR",
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: localizations.login_id_hint,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(189, 189, 189, 1),
                  fontSize: 18,
                  fontFamily: "NotoSansCJKKR",
                ),
                suffixIcon: _idController.text.isNotEmpty
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _passwordController.clear();
                          });
                        },
                        child: Image.asset('assets/images/icClear35.png'),
                      )
                    : SizedBox.shrink(),
              ),
              style: TextStyle(
                color: Color.fromRGBO(33, 33, 33, 1),
                fontSize: 18,
                fontFamily: "NotoSansCJKKR",
              ),
              onChanged: (text) {
                setState(() {});
              },
            ),
            SizedBox(height: 39),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: _passwordController.text.isNotEmpty
                    ? localizations.login_password_hint
                    : "",
                labelStyle: TextStyle(
                  color: Color.fromRGBO(189, 189, 189, 1),
                  fontSize: 13,
                  fontFamily: "NotoSansCJKKR",
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: localizations.login_password_hint,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(189, 189, 189, 1),
                  fontSize: 18,
                  fontFamily: "NotoSansCJKKR",
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 0,
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _passwordController.text.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                _passwordController.clear();
                              });
                            },
                            child: Image.asset('assets/images/icClear35.png'),
                          )
                        : SizedBox.shrink(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      child: isObscure
                          ? Image.asset('assets/images/icVisibilityOff35.png')
                          : Image.asset('assets/images/icVisibility35.png'),
                    ),
                  ],
                ),
              ),
              style: TextStyle(
                color: Color.fromRGBO(33, 33, 33, 1),
                fontSize: 18,
                fontFamily: "NotoSansCJKKR",
              ),
              obscureText: isObscure,
              onChanged: (text) {
                setState(() {});
              },
            ),
            SizedBox(height: 40),
            PrimaryPositiveButton(
              text: localizations.login_button,
              onTapEvent: () {
                _signIn();
              },
              isEnabled:
                  _idController.text.isNotEmpty &&
                  _passwordController.text.isNotEmpty,
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    AuthenticationService.signIn(
          _idController.text,
          _passwordController.text,
          CommonUtil.getHashKey(),
        )
        .then((value) async {
          print(
            "Login Success - ${value.id}, ${value.token}, ${value.created}, ${value.expired}, ${value.status}",
          );
          SignInToken token = appPreference.getSignInToken();
          token.id = value.id;
          token.status = value.status;
          token.token = value.token;
          token.created = value.created;
          token.expired = value.expired;

          appPreference.savePreference(token);

          mLoginToken = value.token;

          _getUser(value.id, value.status);
        })
        .catchError((error) {
          print("Login Error - $error");
          _onLoginFailure();
        });
  }

  void _getUser(int id, int status) async {
    GeneralSetting gs = appPreference.getGeneralSetting();

    ApiService.setOneTimeToken(mLoginToken);
    UserService.getUser(id, gs.lastLoginId != id ? "phothData" : null)
        .then((value) async {
          print("Get User Success - ${value.id}, ${value.username}");
          // map 에 해당 하는 내용 추가 필요
          User user = appPreference.getUser();
          user.id = id;
          user.status = status;

          user.photoUrl = value.photoUrl;
          user.photoFile = value.photoFile;
          // 사진 데이터 저장 로직 추가 필요

          user.username = value.username;
          user.firstName = value.firstName;
          user.lastName = value.lastName;
          user.email = value.email;
          user.role = value.role;
          user.countryCode = value.countryCode;
          user.languageCode = value.languageCode;
          user.dateOfBirth = value.dateOfBirth;
          user.gender = value.gender;
          user.diabetesType = value.diabetesType;
          user.height = value.height;
          user.weight = value.weight;
          user.organization = value.organization;
          user.title = value.title;
          user.preferedUnitLength = value.preferedUnitLength;
          user.preferedUnitWeight = value.preferedUnitWeight;
          user.preferedUnitBG = value.preferedUnitBG;
          user.preferedUnitTemperature = value.preferedUnitTemperature;
          user.statusMessage = value.statusMessage;
          user.registered = value.registered;

          user.isMinor = (value.isMinor == 1);

          user.serviceType = value.serviceType;

          appPreference.savePreference(user);

          _registerEoica();
        })
        .catchError((error) {
          print("Get User Error - $error");
          _onLoginFailure();
        });
  }

  void _registerEoica() async {
    GeneralSetting gs = appPreference.getGeneralSetting();

    ApiService.setOneTimeToken(mLoginToken);
    EoicaService.registerEoica(
          Eoica(
            deviceId: gs.deviceId,
            swVersion: "1.0.0",
            os: 2, // 1: Android, 2: iOS
            model: 0x00001,
          ),
        )
        .then((value) {
          print("Register Eoica Success - ${value.id}");
          _forceRegisterFcm();
        })
        .catchError((error) {
          print("Register Eoica Error - $error");
          _onLoginFailure();
        });
  }

  void _forceRegisterFcm() async {
    FirebaseMessaging.instance.getToken().then((token) {
      print("FCM Token - $token");

      ApiService.setOneTimeToken(mLoginToken);

      if (token != null) {
        FcmService.forceRegisterFcm(Fcm(deviceToken: token))
            .then((value) {
              print("Force Register FCM Success - ${value.id}");
              _findOneSettings();
            })
            .catchError((error) {
              print("Force Register FCM Error - $error");
              _onLoginFailure();
            });
      } else {
        _onLoginFailure();
      }
    });
  }

  void _findOneSettings() async {
    User user = appPreference.getUser();

    ApiService.setOneTimeToken(mLoginToken);

    if (user.id != null) {
      SettingService.findOneSettings(user.id!)
          .then((value) {
            print("Find One Settings Success - ${value.id}");
            _onLoginSuccess();
          })
          .catchError((error) {
            print("Find One Settings Error - $error");
            _onLoginFailure();
          });
    } else {
      _onLoginFailure();
    }
  }

  void _onLoginSuccess() async {
    print("onLoginSuccess");

    // Navigator를 미리 저장
    final navigator = Navigator.of(context);

    LogInToken loginToken = appPreference.getLogInToken();
    SignInToken signInToken = appPreference.getSignInToken();

    loginToken.pid = signInToken.id;
    loginToken.token = signInToken.token;
    loginToken.created = signInToken.created;
    loginToken.expired = signInToken.expired;

    appPreference.savePreference(loginToken);
    signInToken.clear();

    GeneralSetting gs = appPreference.getGeneralSetting();
    User user = appPreference.getUser();
    gs.lastLoginUsername = user.username;
    gs.lastLoginUserRole = user.role;
    gs.lastLoginId = loginToken.pid ?? 0;

    appPreference.savePreference(gs);

    // 네비게이션 실행
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => SettingScreen()),
      (Route<dynamic> route) => false,
    );
  }

  void _onLoginFailure() {
    print("_onLoginFailure");
    appPreference.getLogInToken().clear();
    appPreference.getSignInToken().clear();
    appPreference.getUser().clear();

    _idController.clear();
    _passwordController.clear();
    setState(() {});
  }
}
