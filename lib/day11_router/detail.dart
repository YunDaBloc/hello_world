import 'package:flutter/material.dart';

class KSJDetailScreen extends StatelessWidget {

  static const String routeName = "/detail";

  final String message;

  KSJDetailScreen(this.message);

  @override
  Widget build(BuildContext context) {

    print("$message");

    return Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.of(context).pop("a detail message");
            },
          ),
        ),
        body: Center(
            child: RaisedButton(
                child: Text("跳转到详情"),
                onPressed: (){
//                  Navigator.pop(context);
                  Navigator.of(context).pop("a detail message");
                }
            )
        )
    );
  }
}
