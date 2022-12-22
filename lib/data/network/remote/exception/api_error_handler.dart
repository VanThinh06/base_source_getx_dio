import 'package:bytehr22/data/models/base_api/error_response.dart';
import 'package:dio/dio.dart';

mixin ApiErrorHandler {
  static dynamic getMessage(dynamic error) {
    dynamic errorDescription = '';
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorDescription = 'Request to API server was cancelled';
              break;
            case DioErrorType.connectTimeout:
              errorDescription = 'Connection timeout with API server';
              break;
            case DioErrorType.other:
              errorDescription =
                  'Connection to API server failed due to internet connection';
              break;
            case DioErrorType.receiveTimeout:
              errorDescription =
                  'Receive timeout in connection with API server';
              break;
            case DioErrorType.response:
              switch (error.response!.statusCode) {
                   message = _handleError(
        dioError.response?.statusCode,
        dioError.response?.data,
      );
      break;
              }
              break;
            case DioErrorType.sendTimeout:
              errorDescription = 'Send timeout with server';
              break;
          }
        } else {
          errorDescription = 'Unexpected error occured';
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = 'is not a subtype of exception';
    }

    // TODO: Edit alert.error
    // show errors
    // Get.snackbar(
    //   "Hey i'm a Errors SnackBar!", // title
    //   errorDescription.toString(), // message
    //   icon: const Icon(Icons.error_outline),
    //   backgroundColor: ColorResources.PINK,
    //   shouldIconPulse: true,
    //   isDismissible: true,
    //   duration: const Duration(seconds: 3),
    // );
    return errorDescription;
  }

  String _handleError(int? statusCode, dynamic error) {
  switch (statusCode) {
    case 400:
      return 'Bad request';
    case 401:
      return 'Unauthorized';
    case 403:
      return 'Forbidden';
    case 404:
      return error['errorDescription'];
    case 500:
      return 'Internal server error';
    case 502:
      return 'Bad gateway';
    default:
      return 'Oops something went wrong';
  }
}
@override
  String toString() => errorDescription;
}

