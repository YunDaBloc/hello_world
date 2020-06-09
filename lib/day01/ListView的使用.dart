import 'package:flutter/material.dart';

main() {
  runApp(KSJApp());
}

class KSJApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KSJHomePage(),
    );
  }
}

class KSJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表')
      ),
      body: KSJHomePageBody(),
    );
  }
}

class KSJHomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // listView是可以滚动的
    return ListView(
      padding: EdgeInsets.only(top: 8),
      children: <Widget>[
        KSJHomePageBodyItemWidget("Apple1", "Macbook Product1", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        KSJHomePageBodyItemWidget("Apple2", "Macbook Product2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        KSJHomePageBodyItemWidget("Apple3", "Macbook Product3", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
        KSJHomePageBodyItemWidget("Apple1", "Macbook Product1", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        KSJHomePageBodyItemWidget("Apple2", "Macbook Product2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        KSJHomePageBodyItemWidget("Apple3", "Macbook Product3", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
        KSJHomePageBodyItemWidget("Apple1", "Macbook Product1", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        KSJHomePageBodyItemWidget("Apple2", "Macbook Product2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        KSJHomePageBodyItemWidget("Apple3", "Macbook Product3", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
        KSJHomePageBodyItemWidget("Apple1", "Macbook Product1", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        KSJHomePageBodyItemWidget("Apple2", "Macbook Product2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        KSJHomePageBodyItemWidget("Apple3", "Macbook Product3", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
        KSJHomePageBodyItemWidget("Apple1", "Macbook Product1", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        KSJHomePageBodyItemWidget("Apple2", "Macbook Product2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        KSJHomePageBodyItemWidget("Apple3", "Macbook Product3", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
      ],
    );
  }
}

class KSJHomePageBodyItemWidget extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;

  final style1 = TextStyle(fontSize: 25, color: Colors.orange);
  final style2 = TextStyle(fontSize: 15, color: Colors.green);

  KSJHomePageBodyItemWidget(this.title, this.desc, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 8,color: Colors.black12)
      ),
      child: Column(
        // 主轴的简单使用
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 8),
          Text(this.title, style: style1),
          SizedBox(height: 8),
          Text(this.desc,  style: style2),
          // 图片具有IO操作来处理耗时操作
          // 注意图形警告
          Container(
              padding: EdgeInsets.all(8),
              child: Image.network(this.imageURL,fit: BoxFit.cover))
        ],
      ),
    );
  }
}





