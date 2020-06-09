/*
理解生命周期的函数能做什么以及意义？

1.初始化一些数据、变量、状态
2.发送网络请求
3.监听属性变化
4.进行一些事件的监听controller添加监听事件
5.管理内存：一些定时器手动进行销毁
 */

import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
      home: KSJScaffold()
  ));
}

/*
StatelessWidget生命周期函数执行过程？

flutter: 构造函数被调用
flutter: build函数被调用
flutter: build函数被调用
 */
class KSJStatelessWidget extends StatelessWidget {

  final String message;

  KSJStatelessWidget(this.message) {
    print('构造函数被调用');
  }

  @override
  Widget build(BuildContext context) {
    print('build函数被调用');
    return Container();
  }
}



/*
performing hot restart...
Syncing files to device iPhone X...
Restarted application in 2,941ms.
flutter: 开始：父节点发生改变或新建
flutter: 1.KSJApp的构造函数被调用
flutter: 2.KSJApp的createState被调用
flutter: 3.KSJApp的_KSJAppState被调用
flutter: 4.KSJApp的initState被调用
flutter: 父节点build被调用=>didChangeDependencies
flutter: 5.KSJApp的build被调用
flutter: 开始：父节点发生改变或新建
flutter: 1.KSJApp的构造函数被调用
flutter: KSJ的didUpdateWidget
flutter: 5.KSJApp的build被调用
flutter: 开始：父节点发生改变或新建
flutter: 1.KSJApp的构造函数被调用
flutter: KSJ的didUpdateWidget
flutter: 5.KSJApp的build被调用
 */
class KSJScaffold extends StatefulWidget {
  @override
  _KSJScaffoldState createState() => _KSJScaffoldState();
}

class _KSJScaffoldState extends State<KSJScaffold> {

  num _count = 0;

  @override
  Widget build(BuildContext context) {
    print("开始：父节点发生改变或新建");
    return  Scaffold(
        appBar: AppBar(title: Text('KSJ')),
        body: Column(
          children: <Widget>[
            KSJApp("ksj"),
            RaisedButton(child: Text('+'), onPressed: (){
              setState(() {
                _count++;
              });
            }),
            Text('${this._count}')
          ],
        )
    );
  }
}


class KSJApp extends StatefulWidget {

  final String message;

  KSJApp(this.message) {
    print('1.KSJApp的构造函数被调用');
  }

  @override
  _KSJAppState createState() {
    print('2.KSJApp的createState被调用');
    return _KSJAppState();
  }
}

class _KSJAppState extends State<KSJApp> {

  num _counter = 0;

  _KSJAppState(){
    print('3.KSJApp的_KSJAppState被调用');
  }

  @override
  void initState() {
    // TODO: implement initState
    //  @mustCallSuper
    super.initState();
    print('4.KSJApp的initState被调用');
  }

  // 数据改变依赖的时候会发生改变并调用
  // 情况1：调用 initState会调用
  // 情况2：从其他对象中依赖一些数据发生改变时，比如前面我们提到的inheritedWidget(这个后面会讲到)
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(KSJApp oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('KSJ的didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    print('5.KSJApp的build被调用');
    return Center(
      child: Column(
        children: <Widget>[
          Text('$_counter'),
          RaisedButton(child:Text("增加"), onPressed: (){
            // set方法的调用会触发build的方法的使用
            print('set方法的调用会触发build的方法的调用');
            setState(() {
              _counter++;
            });
          })
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('6.KSJApp的dispose被调用');
    super.dispose();
  }
}






