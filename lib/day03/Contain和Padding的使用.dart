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
      body: Container(
        width: double.infinity,
        height: 200,
//        color: Colors.red,
        child: Text('Hell World'),
        alignment: Alignment(0, 0),
        margin: EdgeInsets.all(10),
        transform: Matrix4.rotationZ(0.3),
        // 整边框
        decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(
                width: 5,
                color: Colors.purple
            ),
            // 切圆角
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(color: Colors.red, offset: Offset(10, 10), spreadRadius: 10, blurRadius: 20),
            ]
        ),
      ),
    );
  }
}




// padding布局
class KSJHomeContent extends StatefulWidget {
  @override
  _KSJHomeContentState createState() => _KSJHomeContentState();
}

class _KSJHomeContentState extends State<KSJHomeContent> {
  @override
  Widget build(BuildContext context) {
    return KSJPaddingNewWidget();
  }
}

class KSJPaddingNewWidget extends StatelessWidget {
  const KSJPaddingNewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
//      padding: const EdgeInsets.symmetric(8.0),
//      padding: const EdgeInsets.only(8.0),
//      padding: const EdgeInsets.fromLTRB(8.0),
      child: Text('你好呀, KSJ', style: TextStyle(
          color: Colors.blue, backgroundColor: Colors.red)),
    );
  }
}

