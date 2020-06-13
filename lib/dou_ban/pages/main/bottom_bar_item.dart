import 'package:flutter/material.dart';

class KSJBottomBarItem extends BottomNavigationBarItem {
  KSJBottomBarItem(String iconName, String title) : super(
      icon: Image.asset("assets/images/tabs/$iconName.png", width: 32.0, gaplessPlayback: true),
      activeIcon: Image.asset("assets/images/tabs/${iconName}_active.png", width: 32.0, gaplessPlayback: true),
      title: Text("$title")
  );
}

/*
*
* BottomNavigationBarItem的控件的封装
* */
