import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());




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
  static const String routeName = "/";

  @override
  _KSJHomePageState createState() => _KSJHomePageState();
}

class _KSJHomePageState extends State<KSJHomePage>
    with SingleTickerProviderStateMixin {
  // 创建AnimationController
  AnimationController _controller;
  Animation _animation;

  Animation _sizeAnim;
  Animation _colorAnim;
  Animation _opacityAnim;
  Animation _radiansAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // 设置Curve的值
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.linear);

    // Tween
    // 3.1 创建size的tween
    _sizeAnim = Tween(begin: 10.0, end: 200.0).animate(_controller);
    // 3.2 创建color的tween
    _colorAnim = ColorTween(begin: Colors.orange, end: Colors.purple).animate(_controller);
    // 3.3 创建opacity的tween
    _opacityAnim = Tween(begin: 0.0, end: 1.0).animate(_controller);
    // 3.4 创建_radians的tween
    _radiansAnim = Tween(begin: 0.0, end: 2 * pi).animate(_controller);


    // 监听动画状态的改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    /**
     * 1.大小的变化
     * 2.颜色变化
     * 3.透明度变化动画
     * 4.旋转动画
     * */
    print("执行_homePageState...");
    return Scaffold(
        appBar: AppBar(
          title: Text("InheritedWidget"),
        ),
        body: Center(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child){
                return Center(
                  child: Opacity(
                    opacity: _opacityAnim.value,
                    child: Transform(
                      // 如何让中心点进行旋转
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(_radiansAnim.value),
                      child: Container(
                        width: _sizeAnim.value,
                        height: _sizeAnim.value,
                        color: _colorAnim.value,
                      ),
                    ),
                  ),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.star),
            onPressed: () {
              if (_controller.isAnimating) {
                _controller.stop();
              } else {
                _controller.forward();
              }
            }));
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
