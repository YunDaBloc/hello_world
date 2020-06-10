import 'package:flutter/material.dart';
import 'initialize_items.dart';

class KSJMainPage extends StatefulWidget {
  @override
  _KSJMainPageState createState() => _KSJMainPageState();
}

class _KSJMainPageState extends State<KSJMainPage> {

  int _currentIndex = 0;

  bool loaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((res) => setState(() {
      this.loaded = true;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loaded == false ? KSJLoadedImages() : IndexedStack(
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

// 加载底部高亮的缓存图片
class KSJLoadedImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Image.asset("assets/images/tabs/group_active.png", fit: BoxFit.cover, width: 0, height: 0),
        Image.asset("assets/images/tabs/home_active.png", fit: BoxFit.cover, width: 0, height: 0),
        Image.asset("assets/images/tabs/mall_active.png", fit: BoxFit.cover, width: 0, height: 0),
        Image.asset("assets/images/tabs/profile_active.png", fit: BoxFit.cover, width: 0, height: 0),
        Image.asset("assets/images/tabs/subject_active.png", fit: BoxFit.cover, width: 0, height: 0)
      ],
    );
  }
}


