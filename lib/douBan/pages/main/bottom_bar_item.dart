import 'package:flutter/material.dart';

class KSJBottomBarItem extends BottomNavigationBarItem {
  KSJBottomBarItem(String iconName, String title) : super(
      icon: Image.asset("assets/images/tabs/$iconName.png", width: 24.0, height: 24.0),
      activeIcon: Image.asset("assets/images/tabs/${iconName}_active.png", width: 24.0, height: 24.0),
      title: Text("$title")
  );
}