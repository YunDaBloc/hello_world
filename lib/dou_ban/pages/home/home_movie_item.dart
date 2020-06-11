import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/home_model.dart';
import '../../widgets/dash_line.dart';
import '../../widgets/star_rating.dart';

class KSJHomeMovieItem extends StatelessWidget {

  // 接收数据的模型
  final MovieItem movie;

  // 重写构造方法
  KSJHomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      // 主要内容区域
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(),
          SizedBox(
            height: 8,
          ),
          buildContent(),
          SizedBox(
            height: 8,
          ),
          buildFooter(),
        ],
      ),
      // 底部边框
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                width: 8,
                color: Color(0xffcccccc),
            ),
        ),
      ),
    );
  }


  // 1.头部的布局：函数
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
          "NO.${movie.rank}",
          style:TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 131, 95, 36)
          )
      ),
    );
  }


  // 2.内容区域的布局：函数
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildLeftContentImage(),
        SizedBox(
          width: 8,
        ),
        buildMiddleLeftContent(),
        SizedBox(
          width: 8,
        ),
        buildMiddleRightLines(),
        SizedBox(
          width: 8,
        ),
        buildRightContentWish()
      ],
    );
  }

  // 2.1内容区域的图片
  Widget buildLeftContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        movie.imageURL,
        height: 150,
      ),
    );
  }

  // 2.2内容的信息
  Widget buildMiddleLeftContent() {
    return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildContentInfoTitle(),
            SizedBox(
              height: 8,
            ),
            buildContentInfoRate(),
            SizedBox(
              height: 8,
            ),
            buildContentInfoDesc()
          ],
        )
    );
  }

  // 2.2.1
  Widget buildContentInfoTitle() {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
              child: Icon(
                Icons.play_circle_outline,
                color: Colors.pink,
                size: 40,
              ),
            baseline: TextBaseline.ideographic,
            alignment: PlaceholderAlignment.middle,
          ),
          WidgetSpan(child: Text(movie.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),alignment: PlaceholderAlignment.middle),
          WidgetSpan(child: Text("(${movie.playDate})"), style: TextStyle(fontSize: 18, color: Colors.grey))
        ]
      ),
    );
  }

  // 2.2.2
  Widget buildContentInfoRate() {
    return Row(
      children: <Widget>[
        KSJStarsWidget(
          rating: movie.rating,
          size: 20,
        ),
        SizedBox(
          width: 6,
        ),
        Text("${movie.rating}",style: TextStyle(fontSize: 16))
      ],
    );
  }

  // 2.2.3
  Widget buildContentInfoDesc() {
    final genresString = movie.genres.join(" ");
    final directorString = movie.director.name;
    List<Actor> casts = movie.casts;
    final actorString = movie.casts.map((item) => item.name).join(" ");
    return Text("$genresString / $directorString / $actorString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }


  // 2.3内容区域分割线
  Widget buildMiddleRightLines() {
    return Container(
      height: 150,
      child: KSJDashedLine(
        axis: Axis.vertical,
        dashedWidth: 1.0,
        dashedHeight: 6,
        count: 20,
        color: Colors.pink,
      ),
    );
  }

  // 2.4内容区域的喜欢想看的图片
  Widget buildRightContentWish() {
    return Container(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/home/wish.png", width: 50, height: 50),
          Text(" 想看",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 235, 170, 60),
            ),
          )
        ],
      ),
    );
  }


  // 3.尾部的布局：函数
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        "《${movie.originalTitle}》",
        style: TextStyle(
            fontSize: 20,
            color: Color(0xff666666)
        ),
      ),
    );
  }
}


/*
*
* 首页Home的body部分的Item的Widget
* 仿写豆瓣电影评分列表
* */