import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
     * 1.一旦设置了主题，那么应用程序中的某些Widget，就会直接使用主题的样式
     * 2.
     */
    return MaterialApp(
      title: "InheritedWidget",
      theme: ThemeData(
        // 亮度——暗黑模式和亮度模式——枚举值
        brightness: Brightness.light,
        // 全局主题颜色
        primarySwatch: Colors.green,
        // 可以对全局颜色进行覆盖——覆盖重写包含关系
        // primaryColor: Colors.black,
        // 单独设置控件Float和Switch的颜色
        // accentColor: Colors.black,
        splashColor: Colors.transparent,
        // 设置无水波纹的效果
        highlightColor: Colors.transparent,
      ),
      home: KSJHomePage(),
    );
  }
}

class KSJHomePage extends StatefulWidget {
  @override
  _KSJHomePageState createState() => _KSJHomePageState();
}

class _KSJHomePageState extends State<KSJHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("你好"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("早上好"),
            // 被主题颜色影响3
            Switch(value: false, onChanged: (value){
            })
          ],
        ),
      ),
      // 被主题颜色影响1
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("你好1")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("你好2")
            )
          ]),
    );
  }
}
