import 'package:bytehr22/data/local/shared_preferences/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  final SharedPreferences _prefs;

  /// constructor
  PrefsHelper(this._prefs);

  /// Remember Login: ----------------------------------------------------------
  bool get getRemember {
    return _prefs.getBool(Preferences.isLogin) ?? false;
  }

  void setRemember({required bool status}) {
    _prefs.setBool(Preferences.isLogin, status);
  }

  /// User:-----------------------------------------------------------------
  int get getIndent {
    return _prefs.getInt(Preferences.idUser) ?? 0;
  }

  void setIndent({required bool id}) {
    _prefs.setBool(Preferences.idUser, id);
  }

  /// JWT:------------------------------------------------------------------
  void setJWT({required String jwt}) {
    _prefs.setString(Preferences.jwt, jwt);
  }

  String get getJWT {
    return _prefs.getString(Preferences.jwt) ?? '';
  }

  /// RefereshToken:------------------------------------------------------------------
  void setRefreshToken({required int refereshToken}) {
    _prefs.setInt(Preferences.refreshToken, refereshToken);
  }

  String get getRefreshToken {
    return _prefs.getString(Preferences.refreshToken) ?? '';
  }

  /// User:------------------------------------------------------------------
  void setUser({required String user}) {
    _prefs.setString(Preferences.user, user);
  }

  String get getUser {
    return _prefs.getString(Preferences.user) ?? '';
  }

  /// PASSWORD:------------------------------------------------------------------
  void setPassword({required String password}) {
    _prefs.setString(Preferences.password, password);
  }

  String get getPassword {
    return _prefs.getString(Preferences.password) ?? '';
  }
}
