import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_office_task/app/model/post_office/apiPostOfficeListGetByNameV1.dart';
import 'package:post_office_task/app/ui/views/login/login_view.dart';
import 'package:post_office_task/app/ui/views/postoffice_details/postoffice_details_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../../model/post_office/modelPostOffice.dart';

class HomeViewModel extends BaseViewModel {
  List<PostOffice> postOffices = [];

  Future<void> fetchPostOfficeList() async {
    setBusyForObject(fetchPostOfficeList, true);
    try {
      var response = await apiPostOfficeListGetByNameV1();
      postOffices = response.postOffices;
      notifyListeners();
    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.white);
    } finally {
      setBusyForObject(fetchPostOfficeList, false);
    }
  }

  void handelDetailsTapButton(PostOffice postOffice) {
    Get.to(
      () => PostofficeDetailsView(postOffice: postOffice),
    );
  }

  void handelLogOutButtonTap() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("LogIn");
    Get.offAll(() => const LoginView());
  }
}
