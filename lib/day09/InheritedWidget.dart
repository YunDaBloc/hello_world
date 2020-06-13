import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class KSJContentWidget extends InheritedWidget {
  // 1.共享的数据
  final int counter;

  // 2.定义构造方法
  KSJContentWidget({this.counter, Widget child}): super(child: child);

  // 3.获取组件最近的当前InheritedWidget
  static KSJContentWidget of(BuildContext context) {
    // 沿着Element树，去找到最近的KSJContentElement,从Element中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 4.决定要不要回调State中的didChangeDependencies
  // 如果返回true：执行依赖当期的InheritedWidget的state中的didChangeDependencies
  @override
  bool updateShouldNotify(KSJContentWidget oldWidget) {
    // TODO: implement updateShouldNotify
    // 值发生改变的时候是否发出通知——执行依赖的方法是否执行
    return oldWidget.counter != counter;
  }
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
      home: KSJHomePage(),
    );
  }
}

class KSJHomePage extends StatefulWidget {
  @override
  _KSJHomePageState createState() => _KSJHomePageState();
}

class _KSJHomePageState extends State<KSJHomePage> {

  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      body: KSJContentWidget(
        counter: _counter,
        child: Column(
          children: <Widget>[
            KSJShowData01(),
            KSJShowData02(),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            setState(() {
              _counter++;
            });
          }) ,
    );
  }
}


class KSJShowData01 extends StatefulWidget {

  @override
  _KSJShowData01State createState() => _KSJShowData01State();
}

class _KSJShowData01State extends State<KSJShowData01> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('执行了该方法...');
  }

  @override
  Widget build(BuildContext context) {

    int counter = KSJContentWidget.of(context).counter;

    return Card(
      color: Colors.red,
      child: Text("当前计数： $counter"),
    );
  }
}

class KSJShowData02 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    int counter = KSJContentWidget.of(context).counter;

    return Container(
      color: Colors.green,
      child: Text("当前计数： $counter"),
    );
  }
}

