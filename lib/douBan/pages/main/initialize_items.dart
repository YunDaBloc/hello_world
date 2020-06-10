import 'package:flutter/material.dart';
import '../home/home.dart';
import '../subject/subject.dart';
import '../group/group.dart';
import '../mall/mall.dart';
import '../profile/profile.dart';
import 'bottom_bar_item.dart';

List<KSJBottomBarItem> items = [
  KSJBottomBarItem("tab_btn_sy", "首页"),
  KSJBottomBarItem("tab_btn_wd", "书影音"),
  KSJBottomBarItem("tab_btn_xk", "小组"),
  KSJBottomBarItem("tab_btn_xx", "市集"),
  KSJBottomBarItem("tab_btn_zb", "我的"),
];

List<Widget> pages = [
  KSJHomePage(),
  KSJSubjectPage(),
  KSJGroupPage(),
  KSJMallPage(),
  KSJProfilePage(),
];
