import 'package:flutter/material.dart';
import 'initialize_items.dart';

class KSJMainPage extends StatefulWidget {
  @override
  _KSJMainPageState createState() => _KSJMainPageState();
}

class _KSJMainPageState extends State<KSJMainPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        // 启动页的时候会同时执行5个init方法
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: items,
      ),
    );
  }

//  第二种：函数封装方式
//  Widget buildBottomItem(iconName, title) {
//    BottomNavigationBarItem(
//        icon: Icon(Icons.people),
//        activeIcon: Icon(Icons.people),
//        title: Text("$title")
//    );
//  }
}

/*
*
* BottomNavigationBar底部tabBar的创建
* */
