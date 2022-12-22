import 'package:bytehr22/app_binding.dart';
import 'package:bytehr22/routes/app_pages.dart';
import 'package:bytehr22/routes/routes_paths/splash_routes.dart';
import 'package:bytehr22/views/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'di/service_locator.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: SplashRoutes.LOGIN_PAGE,
      getPages: AppPages.listPage,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      locale: const Locale('vi', 'VN'),
      supportedLocales: const [Locale('vi', 'VN')],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
