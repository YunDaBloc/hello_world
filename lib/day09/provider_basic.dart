import 'package:flutter/material.dart';
import 'package:hello_world/day09/viewmodel.dart';
import 'package:provider/provider.dart';

/*
 * 优化通信的办法——1.不执行button事件 2.子控件不执行build的方法
 * 1.创建自己需要共享的数据
 * 2.在应用程序的顶层ChangeNotifierProvider
 * 3.在其它位置使用共享的数据
 * Provider.of: 当Provider中的数据发生改变时, Provider.of所在的Widget整个build方法都会重新构建
 * Consumer(相对推荐): 当Provider中的数据发生改变时, 执行重新执行Consumer的builder
 * Selector: 1.selector方法(作用,对原有的数据进行转换) 2.shouldRebuild(作用,要不要重新构建)
 * 执行的前提是没有执行setState的方法
 * 6级共享数据的使用
 */

void main(){
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => KSJContentViewModel()),
        ],
        child: MyApp(),
      )
  );

//    ChangeNotifierProvider(
//        child: MyApp(),
//        create: (ctx) => KSJContentViewModel()
//    ),
//  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "InheritedWidget",
      theme: ThemeData(
        // 主题颜色
        primarySwatch: Colors.green,
        splashColor: Colors.transparent,
        // 设置无水波纹的效果
        highlightColor: Colors.transparent,
      ),
      home: KSJHomePage(),
    );
  }
}

class KSJHomePage extends StatefulWidget {
  @override
  _KSJHomePageState createState() => _KSJHomePageState();
}

class _KSJHomePageState extends State<KSJHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            KSJShowData01(),
            KSJShowData02(),
          ],
        ),
      ),
      // 消费者模型：获取监测者
      // 可优化
      // Selector1 Selector2 Selector3 Selector4
      floatingActionButton: Selector<KSJContentViewModel, KSJContentViewModel>(
        selector: (ctx, counterVm) => counterVm,
        shouldRebuild: (prev, next) => false,
        child: Icon(Icons.add),
        builder: (ctx, counterVM, child){
          print("KSJContentViewModel：FloatingActionButton");
          return FloatingActionButton(
              child: child,
              onPressed: (){
                counterVM.counter += 1;
              });
        },
      ),
    );
  }
}

//class KSJShowData01 extends StatefulWidget {
//
//  @override
//  _KSJShowData01State createState() => _KSJShowData01State();
//}
//
//class _KSJShowData01State extends State<KSJShowData01> {
//
//  @override
//  void didChangeDependencies() {
//    // TODO: implement didChangeDependencies
//    super.didChangeDependencies();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    int counter = Provider.of<KSJContentViewModel>(context).counter;
//    print('执行了该方法...1 + KSJShowData01');
//    return Card(
//      color: Colors.red,
//      child: Text("当前计数： $counter"),
//    );
//  }
//}

// 开发中使用最多的是02中的方法
class KSJShowData01 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // 每次改变都会执行
    int counter = Provider.of<KSJContentViewModel>(context).counter;

    print('执行了该方法...1 + KSJShowData01');
    return Card(
      color: Colors.red,
      child: Text("当前计数： $counter"),
    );
  }
}

// 开发中使用最多的是02中的方法
class KSJShowData02 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    print("执行了该方法...2 + KSJShowData02");

    return Container(
      color: Colors.green,
      // 可优化
      // Consumer2 Consumer3 Consumer4 Consumer5 Consumer6的使用
      child: Consumer<KSJContentViewModel>(
        builder: (ctx, counterVM, child){
          return Text("当前计数： ${counterVM.counter}");
        },
      ),
    );
  }
}

