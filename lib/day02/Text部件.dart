
import 'package:flutter/material.dart';

main() => runApp(KSJMyApp());

class KSJMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KSJHomePage(),
    );
  }
}

class KSJHomePage extends StatelessWidget {
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

class KSJHomeContent extends StatefulWidget {
  @override
  _KSJHomeContentState createState() => _KSJHomeContentState();
}


class _KSJHomeContentState extends State<KSJHomeContent> {
  @override
  Widget build(BuildContext context) {
    return TextRichDemo();
  }
}

// Text.rich的认知
class TextRichDemo extends StatelessWidget {
  const TextRichDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(text: "你好",
            children: [
              // 图文混排
              TextSpan(text: "你好1",style: TextStyle(color: Colors.red, fontSize: 25)),
              TextSpan(text: "你好2",style: TextStyle(color: Colors.blue, fontSize: 25)),
              WidgetSpan(child: Image.network("https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg")),
              WidgetSpan(child: Icon(Icons.favorite, color: Colors.red)),
              TextSpan(text: "你好3",style: TextStyle(color: Colors.green, fontSize: 25)),
            ]
        ));
  }
}


// NewTextWidget的认知
class NewTextWidget extends StatelessWidget {
  const NewTextWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
        textAlign: TextAlign.center,
//      maxLines: 2,
//      overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 30,
            color: Colors.red,
//        wordSpacing: 20,
            fontWeight: FontWeight.bold
        ));
  }
}
