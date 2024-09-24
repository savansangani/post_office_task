import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:post_office_task/app/ui/views/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: "Monserrat",
                scaffoldBackgroundColor: Colors.grey.shade50,
                appBarTheme: AppBarTheme(color: Colors.grey.shade50)),
            home: const SplashView(),
          ),
        );
      },
    );
  }
}
