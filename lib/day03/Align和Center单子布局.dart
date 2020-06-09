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
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: Align(
          // Align的布局
          // alignment: Alignment(-1, -1),
          // alignment: Alignment(1, 1),
          alignment: Alignment(0, 0),
          child: Icon(Icons.pets, size: 50)),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Center(
//        child: Icon(
//            Icons.pets,
//            size: 50
//        )
//    );
//  }
}
