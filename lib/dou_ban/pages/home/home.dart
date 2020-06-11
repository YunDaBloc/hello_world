import 'package:flutter/material.dart';
import 'home_content.dart';

class KSJHomePage extends StatefulWidget {
  @override
  _KSJHomePageState createState() => _KSJHomePageState();
}

class _KSJHomePageState extends State<KSJHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: KSJHomeContent(),
    );
  }
}

/*
*
* 首页Home主Widget
* */

