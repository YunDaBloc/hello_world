import 'package:flutter/material.dart';

main() => runApp(KSJMyApp());

class KSJMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('KSJ'),
//      ),
      body: NewWidgetDemo2(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("+++");
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class NewWidgetDemo2 extends StatelessWidget {
  const NewWidgetDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Hello World1"),
            background: Image.network("https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg", fit: BoxFit.cover,),
          ),
          pinned: true,
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    color: index % 2 == 0 ? Colors.red : Colors.black,
                  );
                },
                // 如果不设置滚动的数量，该控件将拥有无限的子控件
                childCount: 50),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5)
        ),
        SliverAppBar(
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Hello World2"),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                width: 30,
                height: 30,
                color: index % 2 == 0 ? Colors.red : Colors.black,
              );
            },
            childCount: 50,
          ),
        )
      ],
    );
  }
}

class SliverDemo1 extends StatelessWidget {
  const SliverDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // 这个控件不能放入普通widgets
      slivers: <Widget>[
        // 两个代理，一个用来布局，一个用来创建控件
        // 注意此处安全区的概念——这里的安全区可以被滚动到
        SliverSafeArea(
          sliver: SliverPadding(
            // 这里注意Padding的使用可以被滚动到
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        color: index % 2 == 0 ? Colors.red : Colors.black,
                      );
                    },
                    // 如果不设置滚动的数量，该控件将拥有无限的子控件
                    childCount: 100),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.5)),
          ),
        ),
      ],
    );
  }
}
