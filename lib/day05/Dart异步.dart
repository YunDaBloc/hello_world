import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../service/http_request.dart';

main() => runApp(KSJMyApp());

class KSJMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

/*
*   两种方式可以监听
*   controller:
*     1.可以设置默认滚动值
*     2.监听滚动
*     3.但是不能监听开始和结束滚动
*   NotificationListener:
*
* */
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController controller = ScrollController(initialScrollOffset: 100);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 发送网络请求
    // 用到第三方的库，记得封装
    final dio = Dio();
    HttpRequest.request('https://httpbin.org/get', params: {"ksj" : "why"}).then((res) {
      print(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KSJ'),
      ),
      body: NotificationListener(
        // 监听全程滚动到方法
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollStartNotification) {
            print("开始滚动...1");
          } else if (notification is ScrollUpdateNotification) {
            print(
                "正在滚动...2:当前滚动比例值${notification.metrics.pixels / notification.metrics.maxScrollExtent}");
            print("正在滚动...2:当前所在点${notification.metrics.pixels}");
            print("正在滚动...2:总滚动距离${notification.metrics.maxScrollExtent}");
          } else if (notification is ScrollEndNotification) {
            print("结束滚动...3");
          }
          // 阻止冒泡
          return false;
        },

        child: ListView.builder(
            controller: controller,
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.people),
                title: Text("联系人$index"),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
//            controller.jumpTo(0);
            controller.animateTo(0,
                duration: Duration(seconds: 1), curve: Curves.easeIn);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}
