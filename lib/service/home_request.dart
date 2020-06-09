import 'package:hello_world/service/config.dart';
import 'package:hello_world/service/http_request.dart';
import 'http_request.dart';

class HomeRequest {
  static void homeRequestMovieList(int start) {
    // 构建url
    final movieURL = "/movie/top250?start=$start&count=${HomeConfig.movieCount}";

    HttpRequest.request(movieURL).then((res) {
      print(res);
    });

  }
}
