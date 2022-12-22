import 'package:bytehr22/data/local/shared_preferences/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  final SharedPreferences _prefs;

  /// constructor
  PrefsHelper(this._prefs);

  /// Login: ----------------------------------------------------------
  bool get getLogged {
    return _prefs.getBool(Preferences.isLogin) ?? false;
  }

  void setLogged({required bool status}) {
    _prefs.setBool(Preferences.isLogin, status);
  }
}
