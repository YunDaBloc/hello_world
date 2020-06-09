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

// 3.Expanded
/*
* Flexible中的属性
* -flex
* Expanded -> Flexible(fit: FlexFit.tight)——使用最多：关系Flexible 和 Expanded
* 空间分配问题
* Flexible: 开发中很少使用这个Widget
*
* */
class KSJHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
        // 固比模型的使用:必须设置 fit: FlexFit.tight,才可以使用
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                width: 1000,
                height: 60,
                color: Colors.red,
                child: Text('你好1'),
              )),
          Expanded(
            flex: 2,
            child: Container(
              width: 200,
              height: 60,
              color: Colors.green,
              child: Text('你好2'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: 30000,
              height: 60,
              color: Colors.blue,
              child: Text('你好3'),
            ),
          )
        ],
      ),
    );
  }
}


