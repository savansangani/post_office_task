import 'package:get/get.dart';
import 'package:post_office_task/app/ui/views/home/home_view.dart';
import 'package:post_office_task/app/ui/views/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  void spalash() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    var sharedPreferences = await SharedPreferences.getInstance();

    var isLogIn = sharedPreferences.getBool("LogIn");

    if (isLogIn != null && isLogIn) {
      Get.to(() => const HomeView());
    } else {
      Get.to(() => const LoginView());
    }
  }
}
