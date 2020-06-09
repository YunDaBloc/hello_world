import 'package:flutter/material.dart';
import '../home/home.dart';
import '../subject/subject.dart';
import '../group/group.dart';
import '../mall/mall.dart';
import '../profile/profile.dart';
import 'bottom_bar_item.dart';

List<KSJBottomBarItem> items = [
  KSJBottomBarItem("home", "首页"),
  KSJBottomBarItem("subject", "书影音"),
  KSJBottomBarItem("group", "小组"),
  KSJBottomBarItem("mall", "市集"),
  KSJBottomBarItem("profile", "我的"),
];

List<Widget> pages = [
  KSJHomePage(),
  KSJSubjectPage(),
  KSJGroupPage(),
  KSJMallPage(),
  KSJProfilePage(),
];
