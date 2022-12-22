import 'package:bytehr22/data/local/shared_preferences/prefs_helper.dart';
import 'package:bytehr22/data/network/api/login_api.dart';
import 'package:bytehr22/data/network/remote/dio/dio_client.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // get instance
  // Shared preferences
  final _prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<PrefsHelper>(PrefsHelper(_prefs));

  // dio
  getIt.registerSingleton<DioClient>(DioClient());

  // api
  getIt.registerLazySingleton(() => AuthApi(dioClient: getIt<DioClient>()));

  // repository
  // getIt.registerLazySingleton(() => );
}
