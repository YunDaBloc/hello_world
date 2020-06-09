import 'package:flutter/material.dart';

main() => runApp(KSJMyApp());

class KSJMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KSJ'),
      ),
      body: KSJHomeContent(),
    );
  }
}

class KSJHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 1.凸起的按钮
        // 1.没有onPressed：默认是不能跟用户交互的
        RaisedButton(child: Text('RaisedButton+') , onPressed: (){
          print("RaisedButton+++++++");
        }, textColor: Colors.red, color: Colors.green,),

        // 2.FlatButton
        FlatButton(onPressed: (){
          print("FlatButton+++++++");
        }, child: Text('FlatButton+'), color: Colors.yellow),

        // 3.OutlineButton
        OutlineButton(onPressed: (){
          print("OutlineButton+++++++");
        }, child: Text('OutlineButton+'), color: Colors.red),

        // 5.自定义button: 图标-文字-背景-圆角
        FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.favorite, color: Colors.red), Text('喜欢作者')
            ],
          ),
          color: Colors.amberAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          onPressed: (){
            print("喜欢作者+");
          },
        )
      ],
    );
  }
}

