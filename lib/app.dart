import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:helloworld/core/i18n/localizations_delegate.dart';
import './core/router/router.dart';
import './core/utils/size_fit.dart';
import 'core/shared/app_theme.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize(); // 对HYSizeFit进行初始化
    return MaterialApp(
      title: "美食广场",
      debugShowCheckedModeBanner: false, // 是否在导航栏显示debug
      theme: AppTheme.lightTheme,
      initialRoute: MyRouter.initialRoute,
      routes: MyRouter.routes,
      onGenerateRoute: MyRouter.generateRoute,
      onUnknownRoute: MyRouter.unknownRoute,
      supportedLocales: const [
        Locale("zh"), // 中文
        Locale("en")
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        HYLocalizationsDelegate.delegate,
        S.delegate
      ],
    );
  }
}