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
        // 某些widget的主题
        // button的主题
        buttonTheme: ButtonThemeData(
          height: 25,
          minWidth: 10,
          buttonColor: Colors.yellow
        ),
        // 卡片主题
        cardTheme: CardTheme(
          color: Colors.greenAccent,
          elevation: 10
        ),
        // 文字的主题
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 56, color: Colors.red),

          display3: TextStyle(fontSize: 66),
        ),
      ),
      // 暗黑模式的适配
      darkTheme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 20, color: Colors.green)
        )
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
      // 被主题颜色影响2
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            print("早上好...");
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return KSJDetailPage();
            }));
          }),
    );
  }
}

class KSJDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      // 拷贝主题然后——改变主题的颜色
      data: Theme.of(context).copyWith(
        primaryColor: Colors.red
      ),
// 很少直接创建ThemeData
//      data: ThemeData(
//        // 设置之后从这里往后的widget都会被覆盖
//        primarySwatch: Colors.blue
//      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('详情页'),
//          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Text('detail page'),
        ),
        // 被主题颜色影响2
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              print("早上好...");
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return KSJDetailPage1();
              }));
            }),
      ),
    );
  }
}


class KSJDetailPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情页1'),
      ),
      body: Center(
        child: Text('detail page1'),
      ),
    );
  }
}

