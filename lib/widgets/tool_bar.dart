import 'package:flutter/material.dart';
import 'package:setting/l10n/app_localizations.dart';
import 'package:setting/theme_provider.dart';

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  const ToolBar({
    super.key,
    required this.title,
    required this.localizations,
    required this.themeProvider,
    this.onHomePressed,
    this.visibleHome = false,
  });

  final String title;
  final AppLocalizations localizations;
  final ThemeProvider themeProvider;
  final VoidCallback? onHomePressed;
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
          onPressed: onHomePressed,
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
