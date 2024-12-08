import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  var emaillogin = ''.obs;
  var passwordlogin = ''.obs;
  var rememberMelogin = false.obs;
  var isPasswordVisiblelogin = false.obs;



  void toggleRememberMe(bool? value) {
    rememberMelogin.value =! rememberMelogin.value;
  }

  void togglePasswordVisibility() {
    isPasswordVisiblelogin.value = !isPasswordVisiblelogin.value;
  }

  void loginAccount() {
    if (emaillogin.isEmpty || passwordlogin.isEmpty) {
      Get.snackbar(
        "Error",
        "Email and password cannot be empty",
        backgroundColor: Colors.red.withOpacity(0.5),
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Success",
        "Account created successfully!",
        backgroundColor: Colors.green.withOpacity(0.5),
        colorText: Colors.white,
      );
      //
    }
  }
}
