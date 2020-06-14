import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
* 1.创建自己需要共享的数据
*
*
* */
void main(){
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
        title: Text("InheritedWidget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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

    return Card(
      color: Colors.red,
      child: Text("当前计数： 122"),
    );
  }
}

class KSJShowData02 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.green,
      child: Text("当前计数： 2221"),
    );
  }
}

