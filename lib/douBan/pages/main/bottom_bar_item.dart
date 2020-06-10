import 'package:flutter/material.dart';

class KSJBottomBarItem extends BottomNavigationBarItem {
  KSJBottomBarItem(String iconName, String title) : super(
//      width: 24.0, height: 24.0
      icon: Image.asset("assets/images/${iconName}_n.png"),
      activeIcon: Image.asset("assets/images/${iconName}_p.png"),
      title: Text("$title")
  );
}