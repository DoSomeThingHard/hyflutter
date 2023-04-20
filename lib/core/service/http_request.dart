import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: HTTPConfig.baseURL, connectTimeout: const Duration(seconds: HTTPConfig.timeout),
  );
  static final Dio dio = Dio(baseOptions);    // 初始化Dio传入配置信息

  // Interceptor 拦截器
  static Future<T> request<T>(String url,
      {String method = 'get', Map<String, dynamic>? params, Interceptor? inter}) async {
    // 1.请求的单独配置 Options() 进行实例化
    final options = Options(method: method, headers:{  });

    // 2.创建一个默认的全局拦截器
    Interceptor defaultInter = InterceptorsWrapper(
        onRequest: (RequestOptions options,RequestInterceptorHandler handler) {
          print("拦截了请求");
          handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          print("拦截了响应");
          handler.next(response);
        },
        onError: (DioError err, ErrorInterceptorHandler handler) {
          print("拦截了错误");
          handler.next(err);
        }
    );
    List<Interceptor> inters = [defaultInter];
    // 判断外面是否传入了迭代器，传入了也一起加进来
    if (inter != null) {
      inters.add(inter);
    }
    // 添加拦截器
    dio.interceptors.addAll(inters);

    // 3.发送网络请求
    try {
      Response response = await dio.request<T>(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {        // 明确指定我们捕获到的异常
      return Future.error(e);
    }
  }
}