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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("+++");
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class KSJHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // 重叠的模型自己选择属性
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
            child: Container(
              width: 500,
              height: 100,
              color: Colors.red,
              child: Text('KSJ你好1'),
            )),
        Container(
          child: Container(
            width: 250,
            height: 50,
            color: Colors.green,
            child: Text('KSJ你好2'),
          ),
        ),

        // 重叠子组件的相对定位使用Positioned的部件
        Positioned(
          left: 0,
          bottom: 0,
//          right: 0,
          child: Container(
            child: Container(
              width: 125,
              height: 25,
              color: Colors.blue,
              child: Text('KSJ你好3'),
            ),
          ),
        )
      ],
    );
  }
}
