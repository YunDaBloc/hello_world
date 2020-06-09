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
      // 1. 子组件撑起来
      // 2. 设置Contain的宽高显示问题
      // 3. 没有子组件、没有设置宽高的情况下默认占满父容器
      body: KSJHomeContent(),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: (){
        print("+++");
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class KSJHomeContent extends StatefulWidget {
  @override
  _KSJHomeContentState createState() => _KSJHomeContentState();
}

class _KSJHomeContentState extends State<KSJHomeContent> {
  // Row/Column：继承自Flex
  // Flex： CSS Flex布局
  /*
  * Flex(
  *   direction: Axis.horizontal,
  * ) == Row
  *
  * Flex(
  *   direction: Axis.vertical,
  * ) == Column
  *
  * */
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // 基线必须在有文本的时候才起效
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Container(width: 30, height: 60, color: Colors.red, child: Text('神奇的人', style: TextStyle(fontSize: 20))),
          Container(width: 130, height: 30, color: Colors.yellow, child: Text('神奇的人')),
          Container(width: 80, height: 20, color: Colors.green, child: Text('神奇的人'))
        ],
      ),
    );
  }
}


//class KSJHomeContent extends StatefulWidget {
//  @override
//  _KSJHomeContentState createState() => _KSJHomeContentState();
//}
//
//class _KSJHomeContentState extends State<KSJHomeContent> {
//  // Row/Column：继承自Flex
//  // Flex： CSS Flex布局
//  /*
//  * Flex(
//  *   direction: Axis.horizontal,
//  * ) == Row
//  *
//  * Flex(
//  *   direction: Axis.vertical,
//  * ) == Column
//  *
//  * */
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        // 基线必须在有文本的时候才起效
//        crossAxisAlignment: CrossAxisAlignment.baseline,
//        textBaseline: TextBaseline.alphabetic,
//        children: <Widget>[
//          Container(width: 30, height: 60, color: Colors.red, child: Text('神奇的人', style: TextStyle(fontSize: 20))),
//          Container(width: 130, height: 30, color: Colors.yellow, child: Text('神奇的人')),
//          Container(width: 80, height: 20, color: Colors.green, child: Text('神奇的人'))
//        ],
//      ),
//    );
//  }
//}
