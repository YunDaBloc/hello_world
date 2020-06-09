import 'package:flutter/material.dart';

//  父类引用指向子类对象:多态
//  方法用括号、函数用大括号
//  1.runApp的函数
main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KSJHomePageHome(),
    )
  );
}

//  页面头部
class KSJHomePageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          appBar: AppBar(
            title: Text("KSJHomePageHome"),
          ),
          body: KSJHomePageBody()
      ),
    );
  }
}

//  页面内容区
class KSJHomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Center(
     child:KSJHomePageRow(),
   );
  }
}


// Row元素的可变的尝试
// ignore: must_be_immutable
//  所有的Widget里面都是不可以写状态——状态只能写在状态里面类里面
class KSJHomePageRow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return KSJHomePageRowState();
  }
}


// 子组件可以进行单独的渲染——所以状态在开发中要做到严格的区分变和不变
class KSJHomePageRowState extends State<KSJHomePageRow> {
  // 状态只能写在状态里面类里面
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         Checkbox(
             value: flag,
             onChanged:(value) =>
                 this.setState(() =>
                 flag = value)),
         Text("ksjCheckbox"),
       ],
    );
  }
}



