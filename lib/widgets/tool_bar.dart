import 'package:flutter/material.dart';
import 'package:setting/screens/setting_screen.dart';
import 'package:setting/theme_provider.dart';

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  const ToolBar({
    super.key,
    required this.title,
    required this.themeProvider,
    this.visibleHome = false,
  });

  final String title;
  final ThemeProvider themeProvider;
  final bool visibleHome;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      actions: [
        // Home Button
        IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => SettingScreen()),
              (Route<dynamic> route) => false,
            );
          },
          icon: Icon(
            Icons.home_outlined,
            color: themeProvider.isDarkMode() ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  // AppBar의 기본 높이를 반환합니다.
  // 이 값은 AppBar의 preferredSize 속성에서 가져올 수 있습니다.
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
