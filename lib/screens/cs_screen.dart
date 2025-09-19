import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/l10n/app_localizations.dart';
import 'package:setting/theme_provider.dart';
import 'package:setting/utils/common_util.dart';
import 'package:setting/widgets/custom_listview.dart';
import 'package:setting/widgets/tool_bar.dart';

class CsScreen extends StatelessWidget {
  const CsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context);

    final items = [
      localizations.help,
      localizations.notice,
      localizations.terms_and_conditions,
      localizations.privacy_policy,
      MapEntry(localizations.company_info, true),
      MapEntry(
        MapEntry(
          localizations.string_eoflow_address_title,
          CommonUtil.getAddress(
                PlatformDispatcher.instance.locale.languageCode,
              ) ??
              localizations.string_eoflow_address_content,
        ),
        false,
      ),
      MapEntry(
        MapEntry(
          localizations.string_eoflow_homepage,
          localizations.string_eoflow_url,
        ),
        false,
      ),
    ];

    void onTapItem(String title) {
      print("onTap $title");
    }

    return Scaffold(
      appBar: ToolBar(
        title: localizations.cs,
        localizations: localizations,
        themeProvider: themeProvider,
        onHomePressed: () {
          print("onTapHomeButton");
        },
        visibleHome: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: CustomListview(items: items, onTapItem: onTapItem),
      ),
    );
  }
}
