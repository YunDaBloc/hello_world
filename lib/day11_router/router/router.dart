import 'package:flutter/material.dart';
import '../detail.dart';
import '../main.dart';
import '../about.dart';
import '../unknown.dart';

// 配置文件的使用

class KSJRouter {
  static final Map<String, WidgetBuilder> routes = {
    // 约定俗称的代码规范
    KSJHomePage.routeName: (context) => KSJHomePage(),
    KSJAboutPage.routeName: (context) => KSJAboutPage()
  };

  static final String initialRoute = KSJHomePage.routeName;

  static final RouteFactory generateRoute = (settings) {
    if (settings.name == KSJDetailScreen.routeName) {
      return MaterialPageRoute(builder: (context) {
        return KSJDetailScreen(settings.arguments);
      });
    }
    return null;
  };

  static final RouteFactory unKnownPage = (settings) {
    return MaterialPageRoute(builder: (context) {
      return KSJUnKnownPage();
    });
  };
}
