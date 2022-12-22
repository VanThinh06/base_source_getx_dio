import 'dart:io';
import 'package:bytehr22/data/network/api/constant/endpoints.dart';
import 'package:dio/dio.dart';

class DioClient {
  //dio instance
  Dio? _dio;

  DioClient() {
    _init();
  }

  void _init() {
    _dio = Dio();
// final String jwtToken = getIt.get<PrefsHelper>().;
    _dio!
      ..options.baseUrl = EndPoints.baseUrl
      ..options.connectTimeout = EndPoints.connectionTimeout
      ..options.receiveTimeout = EndPoints.receiveTimeout;
    //   ..httpClientAdapter
    //   ..options.headers = {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $jwtToken'};
    // dio!.interceptors.add(sl.get<LoggingInterceptor>());
  }

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      /// Check token is expired!
      // if (RefreshTokenUtil.isExpired()) {
      //   await RefreshTokenUtil.refreshTokens();
      //   await Future.delayed(
      //     const Duration(
      //       milliseconds: 500,
      //     ),
      //   );
      // }
      Response response = await _dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  ///
  /// Post:----------------------------------------------------------------------
  ///
  Future<Response> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      // if (RefreshTokenUtil.isExpired()) {
      //   await RefreshTokenUtil.refreshTokens();
      //   await Future.delayed(
      //     const Duration(
      //       milliseconds: 500,
      //     ),
      //   );
      // }
      final response = await _dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  ///
  /// Put:----------------------------------------------------------------------
  ///
  Future<Response> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      /// check token
      // if (RefreshTokenUtil.isExpired()) {
      //   await RefreshTokenUtil.refreshTokens();
      //   await Future.delayed(
      //     const Duration(
      //       milliseconds: 500,
      //     ),
      //   );
      // }
      final response = await _dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  ///
  /// Delete:----------------------------------------------------------------------
  ///
  Future<Response> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      // if (RefreshTokenUtil.isExpired()) {
      //   await RefreshTokenUtil.refreshTokens();
      //   await Future.delayed(
      //     const Duration(
      //       milliseconds: 500,
      //     ),
      //   );
      // }
      final response = await _dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }
}
