import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeOut);

  static final Dio dio = Dio(baseOptions);

  // 默认是get请求——这里的async是因为下面的代码里有await
  static Future<T> request<T>(String url,
      {String method = "get",
        Map<String, dynamic> params,
        Interceptor inter}) async {

    // 1.创建单独网络请求
    final options = Options(method: method);

    // 默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(onRequest: (options) {
        print("请求拦截");
        return options;
      },
      onResponse: (response) {
        print("响应拦截");
        return response;
      },
      onError: (error) {
        print("错误拦截");
        return error;
      },
    );

    // 1.先将全局拦截器放入数组中
    List<Interceptor> inters = [dInter];

    // 请求单独拦截器
    // 2.判断单独参数拦截器是否为空，不为空加入到拦截器数组中，等待一起响应
    if (inter != null) {
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

/*
*
*  对dio网络请求封装
* */
