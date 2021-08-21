import 'package:dio/dio.dart';

class DioManege {
  static DioManege? _instance;
  Dio? dio;

  DioManege() {
    dio = Dio();

    dio!.options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      sendTimeout: 5000,
      // 设置请求头
      // headers: {
      //   HttpHeaders.authorizationHeader: 'Bearer${' '}$token'
      // },
      //默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
      // contentType: Headers.formUrlEncodedContentType,
      //共有三种方式json,bytes(响应字节),stream（响应流）,plain
      // responseType: ResponseType.json
    );

    dio!.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions requestOptions, _) {
      print('发起请求');
      _.next(requestOptions);
    }, onResponse: (Response<dynamic> response, _) {
      print('发起请求');
      _.next(response);
    }, onError: (DioError error, _) {
      print('出现错误--${error.toString()}');
      _.next(error);
    }));
  }

  static DioManege getInstance() {
    return _instance ??= DioManege();
  }
}
