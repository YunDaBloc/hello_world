import 'dart:math';
import 'package:flutter/material.dart';
import 'pages/image_detail.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // 设置Curve的值
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    // Tween

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
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 16 / 9,
            ),
            children: List.generate(20, (index) {
              String imageURL =
                  "https://picsum.photos/id/${index}/400/200";
              return GestureDetector(
                onTap: (){
                  // 渐变的转场动画
                  Navigator.of(context).push(PageRouteBuilder(
                       pageBuilder: (ctx, anim1, anim2) {
                        return FadeTransition(
                          opacity: anim1,
                          child: KSJImageDetailPage(imageURL)
                        );
                      }));
                },
                child: Hero(
                  tag: imageURL,
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
        ),
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.star), onPressed: () {}));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
