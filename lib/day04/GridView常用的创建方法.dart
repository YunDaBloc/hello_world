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
      appBar: AppBar(
        title: Text('KSJ'),
      ),
      body: NewCountGridViewNewWidget(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("+++");
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}



class NewCountGridViewNewWidget extends StatelessWidget {
  const NewCountGridViewNewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 9,
      crossAxisSpacing: 5,
      mainAxisSpacing: 10,
      children: List.generate(100, (index) {
        return Container(
          color: index % 2 == 0 ? Colors.red : Colors.blue,
        );
      }),
    );
  }
}



class GridViewMaxExtentNewWidget extends StatelessWidget {
  const GridViewMaxExtentNewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          childAspectRatio: 0.5),
      children: List.generate(1000, (index) {
        return Container(
          color: index % 2 == 0 ? Colors.red : Colors.blue,
        );
      }),
    );
  }
}



class GridViewDemo1NewWidget extends StatelessWidget {
  const GridViewDemo1NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      // 以自身宽度为基准
//        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 35),
      // 以Item个数为基准
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 0.1,
      ),
      children: List.generate(1000, (index) {
        return Container(
          color: index % 2 == 0 ? Colors.red : Colors.blue,
        );
      }),
    );
  }
}
