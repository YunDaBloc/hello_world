import 'package:flutter/material.dart';

class KSJAboutPage extends StatelessWidget {
  static const String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    // 命名路由的参数传递的方法
    final String message = ModalRoute.of(context).settings.arguments as String;

    print(message);

    return Scaffold(
      appBar: AppBar(
        title: Text("关于页面"),
      ),
      body: Center(
        child: Text("关于页面"),
      ),
    );
  }
}
