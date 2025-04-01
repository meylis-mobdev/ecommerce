import 'package:dio/dio.dart';
import 'package:e_commerce/core/storage/auth_local_storage.dart';
import 'package:e_commerce/core/utils/logger.dart';

class DioInstance {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://10.1.19.2:5000/api'));

  static final DioInstance _instance = DioInstance._internal();
  factory DioInstance() => _instance;

  DioInstance._internal() {
    _addInterceptors();
    logger.i("DioInstance initialized!");
  }

  _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: onRequest, onResponse: onResponse),
    );
  }

  Future<Response> get(String path, {QP? queryParameters, Options? options}) =>
      _dio.get(path, queryParameters: queryParameters, options: options);

  Future<Response> post(String path, {dynamic data, Options? options}) =>
      _dio.post(path, data: data, options: options);

  Future<Response> put(String path, {dynamic data, Options? options}) =>
      _dio.put(path, data: data, options: options);

  Future<Response> delete(String path, {Options? options}) =>
      _dio.delete(path, options: options);

  onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    logger.i('onResponse');
    String path = response.realUri.path;
    Map<String, List<String>> headers = response.headers.map;
    //! if sign-in/up
    if (path.contains('sign-in') || path.contains('sign-up')) {
      if (headers.containsKey('set-cookie')) {
        String token = headers['set-cookie']!
            .join('')
            .split("; ")
            .first
            .replaceAll('token=', '');
        AuthLocalStorage().set(token);
      }
    } // ! all other requests
    else {
      logger.i('other request');
    }

    // if (!response.data['success']) {
    //   setStateIsShowToast(true);
    //   setStateToastMessage(response.data['message']);
    // }

    handler.next(response);
  }

  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i('onRequest');
    String token = AuthLocalStorage().get();
    token != '' ? options.headers.addAll({'cookie': 'token=$token'}) : null;
    logger.i('setted token');

    handler.next(options);
  }

  onError(DioException error, ErrorInterceptorHandler handler) {}
}

typedef QP = Map<String, dynamic>;
