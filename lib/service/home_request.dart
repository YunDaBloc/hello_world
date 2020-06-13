import 'package:hello_world/service/config.dart';
import 'package:hello_world/service/http_request.dart';
import 'http_request.dart';
import '../dou_ban/model/home_model.dart';

class HomeRequest {
  static Future<List<MovieItem>> homeRequestMovieList(int start) async{
    // 1.构建url
    final movieURL = "/movie/top250?start=$start&count=${HomeConfig.movieCount}";

    // 2.发送网络请求获取结果
    final result = await HttpRequest.request(movieURL);
    print(result);
    //  ————从耗时操作读取数据时不加await就会报错
    final subjects = result["subjects"];
    // 3.将Map转成Model
    //  ————创建一个空数组
    List<MovieItem> movies = [];
    for (var sub in subjects) {
      //  ————字典转模型处理
      movies.add(MovieItem.fromMap(sub));
    }
    return movies;
  }
}


/*
*
* 首页的网络请求
* */