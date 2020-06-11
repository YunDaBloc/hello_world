import 'package:flutter/material.dart';
import '../dou_ban/pages/main/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      title: "豆瓣1",
      theme: ThemeData(
        // 主题颜色
        primarySwatch: Colors.green,
        splashColor: Colors.transparent,
        // 设置无水波纹的效果
        highlightColor: Colors.transparent,
      ),
      home: KSJHomePages(),
    );
  }
}

class KSJHomePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("豆瓣2"),
//      ),
      body: KSJMainPage()
    );
  }
}

/*
*
* 豆瓣APP的Main函数的入口
* */
