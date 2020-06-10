import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeOut);

  static final Dio dio = Dio(baseOptions);

  // 默认是get请求——这里的async是因为下面的代码里有await
  static Future request(String url,
      {String method = "get",
      Map<String, dynamic> params,
      Interceptor inter}) async {
    // star
    // print(url);

    // 1.创建单独网络请求
    final options = Options(method: method);

    // 默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
      // 请求拦截
      onRequest: (options) {
        print("请求拦截");
        return options;
      },
      // 响应拦截
      onResponse: (response) {
        print("响应拦截");
        return response;
      },
      // 错误拦截
      onError: (error) {
        print("错误拦截");
        return error;
      },
    );

    List<Interceptor> inters = [dInter];

    // 请求单独拦截器
    if (inters != null) {
      inters.add(inter);
    }

    dio.interceptors.addAll(inters);

    // 2.发送网络请求
    try {
      Response response =
          await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
