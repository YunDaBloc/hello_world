import 'package:flutter/material.dart';
import 'package:hello_world/day11_router/router/router.dart';
import 'detail.dart';
import 'about.dart';

// 命名路由的跳转方式
// 原生跳转方式

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "InheritedWidget",
        theme: ThemeData(
          // 主题颜色
          primarySwatch: Colors.green,
          splashColor: Colors.transparent,
          // 设置无水波纹的效果
          highlightColor: Colors.transparent,
        ),
        // home: KSJHomePage(),
        initialRoute: KSJRouter.initialRoute,
        // 命名路由的跳转方式
        routes: KSJRouter.routes,
        // 钩子函数hooks传递参数
        onGenerateRoute: KSJRouter.generateRoute,
        // 错误跳转跳转到这个页面
        onUnknownRoute: KSJRouter.unKnownPage);
  }
}

class KSJHomePage extends StatelessWidget {
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("InheritedWidget"),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("跳转到关于"), onPressed: () => _jumpDetail(context)),
            RaisedButton(
                child: Text("跳转到设置"), onPressed: () => _jumpSetting(context)),
          ],
        ));
  }

  // 定义一个方法
  void _jumpDetail(BuildContext context) {
    Navigator.of(context)
        .pushNamed(KSJAboutPage.routeName, arguments: "a home message");
  }

  // 定义跳转设置的方法
  void _jumpSetting(BuildContext context) {
    Navigator.of(context).pushNamed("/settings");
  }

  //  定义一个方法
  void _jumpDetailAAAAA(BuildContext context) {
    // 对象方法
    Future result =
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      // 通过构造器进行简单的传递
      return KSJDetailScreen("KSJ 你好");
    }));

    // 通过future的方法返回一个数据，进行数据的逆传
    result.then((value) {
      // 这里返回的数据不能为空
      print(value);
    });

    // 静态方法
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return KSJDetailScreen("KSJ 你好");
    }));
  }

  // 定义一个方法
  void _jumpDetailBBBBB(BuildContext context) {
    Navigator.of(context)
        .pushNamed(KSJAboutPage.routeName, arguments: "a home jumpDetailBBBBB");
  }
}
