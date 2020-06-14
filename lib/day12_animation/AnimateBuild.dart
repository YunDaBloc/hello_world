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
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

    // 3.Tween——设置Curve的值
    _sizeAnim = Tween(begin: 50.0, end: 300.0).animate(_animation);

    // 2.监听动画值的改变

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
    print("执行_homePageState...");
    return Scaffold(
        appBar: AppBar(
          title: Text("InheritedWidget"),
        ),
        body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Icon(Icons.favorite,
                  color: Colors.red, size: _sizeAnim.value);
            },
            // child: ,这里参数的目的就是为了避免重复创建子控件进行的优化处理
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.star),
            onPressed: () {
//          _controller.forward();
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
