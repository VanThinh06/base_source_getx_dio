/// errors : [{"code":"l_name","message":"The last name field is required."},{"code":"password","message":"The password field is required."}]

class ErrorResponse {
  late List<Errors> _errors;

  List<Errors> get errors => _errors;

  ErrorResponse({required List<Errors> errors}) {
    _errors = errors;
  }

  ErrorResponse.fromJson(dynamic json) {
    _errors = [];
    json['errors'].forEach((v) {
      _errors.add(Errors.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['errors'] = _errors.map((v) => v.toJson()).toList();
    return map;
  }
}

/// code : "l_name"
/// message : "The last name field is required."

class Errors {
  // late String _code;
  late String _message;

  // String get code => _code;
  String get message => _message;

  Errors({required String message}) {
    // _code = code;
    _message = message;
  }

  Errors.fromJson(dynamic json) {
    // _code = json['code'].toString();
    _message = json['message'].toString();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['code'] = _code;
    map['message'] = _message;
    return map;
  }
}
