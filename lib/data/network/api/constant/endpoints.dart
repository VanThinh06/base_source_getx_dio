class EndPoints {
  EndPoints._();

  // base URL
  static const String baseUrl = "https://bc-apitest.azurewebsites.net/api";

  // connectTimeout
  // timeout in milliseconds for opening url
  static const int connectionTimeout = 15000;

  // receiveTimeout
  // this is not the receiving time limitation
  static const int receiveTimeout = 15000;

  static const String login = '/user/authenticateMobile';

  // user/authenticateMobile  login
  // body = {
  //   'timezone': timezone,
  //   'password': password,
  //   'username': username,
  //   'clientId': clientId == null || !clientId.isNotEmpty
  //       ? null
  //       : clientId.replaceAll('-', '')
  // };
}
