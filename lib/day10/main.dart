import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

/*
*
* EventBus：主要作用是监听事件
* 全局存在不消失，除非程序结束
*/

// 1.创建全局的EventBus对象
final eventBus = EventBus();

class UserInfo {
  String nickName;
  int level;

  UserInfo(this.nickName, this.level);
}

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

class KSJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          KSJButton(),
          KSJText()
        ],
      ),
    );
  }
}

class KSJButton extends StatefulWidget {
  @override
  _KSJButtonState createState() => _KSJButtonState();
}

class _KSJButtonState extends State<KSJButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text("按钮"),
        onPressed: (){
          // 2.发出事件
          final info = UserInfo("KSJ", 18);
          eventBus.fire(info);
        });
  }
}

class KSJText extends StatefulWidget {
  @override
  _KSJTextState createState() => _KSJTextState();
}

class _KSJTextState extends State<KSJText> {


  String _message = "KSJ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 3. 监听事件的类型——具体监听的对象传输的内容
    // 是字符串就传字符串/其他传其他的
    eventBus.on<UserInfo>().listen((data) {
      print("$data + ${data.nickName} + ${data.level}");
      setState(() {
        _message = "$data + ${data.nickName} + ${data.level}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text("$_message");
  }
}
