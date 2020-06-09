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
      body: KSJHomeContent(),
    );
  }
}

class KSJHomeContent extends StatelessWidget {

  final useNameTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();
  // 1. 默认情况下Button上下有一定的间距
  // 2. Button变小： ButtonTheme
  // 3. 取出Button的内边距

  final imageURL = "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: useNameTextEditController,
          onChanged: (value){
            print('$value');
          },
          onSubmitted: (value){
            print('$value');
          },
          decoration: InputDecoration(
              labelText: "username",
              icon: Icon(Icons.people),
              hintText: "请输入用户名",
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.orange[100]
          ),
        ),


        TextField(
          controller: passwordTextEditController,
          onChanged: (value){
            print('$value');
          },
          onSubmitted: (value){
            print('$value');
          },
          decoration: InputDecoration(
              labelText: "password",
              icon: Icon(Icons.people),
              hintText: "请输入密码",
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.orange[100]
          ),
        ),

        SizedBox(height: 20),

        Container(
          // 无限填充
          width: double.infinity,
          height: 38,
          child: FlatButton(onPressed: (){
            print(useNameTextEditController.value.text);
            print(passwordTextEditController.value.text);
          }, child: Text('登 录'), color : Colors.blue,),
        )
      ],
    );
  }
}
