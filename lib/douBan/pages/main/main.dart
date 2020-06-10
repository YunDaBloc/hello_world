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
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: items,
      ),
    );
  }


//  第二种：函数封装方式
//  Widget buildBottonItem(iconName, title) {
//    BottomNavigationBarItem(
//        icon: Icon(Icons.people),
//        activeIcon: Icon(Icons.people),
//        title: Text("$title")
//    );
//  }

}


