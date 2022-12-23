import 'package:bytehr22/data/models/auth/login_request.dart';
import 'package:bytehr22/data/models/base_api/api_response.dart';
import 'package:bytehr22/data/network/api/constant/endpoints.dart';
import 'package:bytehr22/data/network/remote/dio/dio_client.dart';
import 'package:bytehr22/data/network/remote/exception/api_error_handler.dart';
import 'package:dio/dio.dart';

class AuthApi {
  final DioClient dioClient;

  AuthApi({required this.dioClient});

  Future<ApiResponse> signin({required LoginRequest loginRequest}) async {
    try {
      final Response response =
          await dioClient.post(EndPoints.login, data: loginRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
