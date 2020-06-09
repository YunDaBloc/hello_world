//import 'package:dio/dio.dart';
//import 'config.dart';
//
//class HttpRequest {
//
//  static final BaseOptions bseOptions = BaseOptions(
//      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeOut);
//
//  static final Dio dio = Dio();
//
//  // 默认是get请求
//  static Future request(String url,
//      {String method = "get", Map<String, dynamic> params, Interceptor inter}) async{
//
//    print(url);
//    // 1.创建单独网络请求
//    final option = Options(method: method);
//
//
//    // 默认的全局拦截器
//    Interceptor iterable = InterceptorsWrapper(
//      // 请求拦截
//      onRequest: (options) {
//        print("错误拦截");
//        return options;
//      },
//      // 响应拦截
//      onResponse: (response) {
//        print("响应拦截");
//        return response;
//      },
//      // 错误拦截
//      onError: (error) {
//        print("请求拦截");
//        return error;
//      },
//    );
//    List<Interceptor> inters = [iterable];
//    // 请求单独拦截器
//    if (inters != null) {
//      inters.add(inter);
//      dio.interceptors.addAll(inters);
//    }
//
//    // 2.发送网络请求
//    try {
//      Response response = await dio.request(url, queryParameters: params, options: option);
//      return response.data;
//    } on DioError catch(e) {
//      return Future.error(e);
//    }
//  }
//}

import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeOut);
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url, {
    String method = "get",
    Map<String, dynamic> params,
    Interceptor inter}) async {
    // 1.创建单独配置
    final options = Options(method: method);

    // 全局拦截器
    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
        onRequest: (options) {
          print("请求拦截");
          return options;
        },
        onResponse: (response) {
          print("响应拦截");
          return response;
        },
        onError: (err) {
          print("错误拦截");
          return err;
        }
    );
    List<Interceptor> inters = [dInter];

    // 请求单独拦截器
    if (inter != null) {
      inters.add(inter);
    }

    // 统一添加到拦截器中
    dio.interceptors.addAll(inters);

    // 2.发送网络请求
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }
}
