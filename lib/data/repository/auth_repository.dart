import 'package:bytehr22/data/models/auth/login_request.dart';
import 'package:bytehr22/data/network/api/login_api.dart';

class AuthRepository {
  final AuthApi authApi;

  AuthRepository(this.authApi);

  ///
  /// sign in
  ///
  Future<void> signin({
    required LoginRequest loginRequest,
    required Function(LoginRequest auth) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final apiResponse =
        await authApi.signin(loginRequest: loginRequest, oSuccess: onSuccess);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      final LoginRequest loginRequest =
          LoginRequest.fromJson(results as Map<String, dynamic>);
      onSuccess(loginRequest);
    } else {
      onError(apiResponse.error);
    }
  }
}