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
      body: Image.network("https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
    );
  }
}

class KSJHomeContent extends StatelessWidget {
  final imageURL = "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg";
  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imageURL),
      width: 200,
      height: 200,
      fit: BoxFit.fitHeight,
//      alignment: Alignment.bottomCenter,
      alignment: Alignment(0, -2),
    );
  }
}

