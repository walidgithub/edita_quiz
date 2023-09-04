import 'package:edita_quiz/router/app_router.dart';
import 'package:edita_quiz/start_view/start_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: []
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Edita Quiz',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.orange,
              hintColor: Colors.orangeAccent,
            ),
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.startRoute,
          );
        });
  }
}
