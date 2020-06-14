import 'package:flutter/material.dart';

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
      body: GestureDetectorDemo(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
          }) ,
    );
  }
}

class GestureDetectorDemo extends StatelessWidget {
  const GestureDetectorDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GestureDetector(
            onTapDown: (details){
              // 手势事件泄漏，偶然会把事件遗漏到外面
              // 解决办法：不让出现层级的嵌套使用stack
              print("手势按下 outer click");
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.yellow,
              alignment: Alignment.center,
            ),
          ),
          // 手势忽略：间接阻止冒泡功能
          IgnorePointer(
            child: GestureDetector(
              onTapDown: (detail){
                print("手势按下 inner click");
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 手势
class GestureDemo extends StatelessWidget {
  const GestureDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (details){
          print("手势按下: $details");
          // 全局
          print(details.globalPosition);
          // 局部
          print(details.localPosition);
        },
        onTapUp: (details){
          print("手势抬起: $details");
        },
        onTapCancel: (){
          print("手势取消");
        },
        onTap: (){
          print("手势点击");
        },
        // 双击跟上面的事件有冲突
        onDoubleTap: (){
          print("手势双击");
        },
        onLongPress: (){
          print("手势长按");
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.pink,
        ),
      ),
    );
  }
}

// 触摸指针监听
class ListenerDemo extends StatelessWidget {
  const ListenerDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event){
        print("指针按下: $event");
        print(event.position);
        print(event.localPosition);
      },
      onPointerMove: (event){
        print("指针移动: $event");
      },
      onPointerUp: (event){
        print("指针抬起: $event");
      },
      onPointerCancel: (event){
        print("指针取消: $event");
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}

