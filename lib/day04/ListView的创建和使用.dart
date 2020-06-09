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
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Text("你好");
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.red,
              height: 100,
              indent: 30,
              endIndent: 30,
              thickness: 10,
            );
          },
          itemCount: 100
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("+++");
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}




class ListViewBuildNewWidget extends StatelessWidget {
  const ListViewBuildNewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index){
        return Container(
          width: double.infinity,
          height: 100,
          color: index % 2 == 0 ? Colors.red : Colors.black,
//            child: Container(
//              child: Text(
//                "你好"
//              ),
//            ),
        );
      },
    );
  }
}




class ListViewNewWidget extends StatelessWidget {
  const ListViewNewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
//        scrollDirection: Axis.horizontal,
      // item的宽度
//      itemExtent: 120,
      children: List.generate(1, (index) {
        // ignore: missing_
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete),
          title: Text("联系人${index + 1}"),
          subtitle: Text('联系人电话号码:18201532507'),
          isThreeLine: true,
        );
      }),
    );
  }
}
