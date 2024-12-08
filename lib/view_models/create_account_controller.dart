import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var rememberMe = false.obs;
  var isPasswordVisible = false.obs;



  void toggleRememberMe(bool? value) {
    rememberMe.value =! rememberMe.value;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void createAccount() {
    if (email.isEmpty || password.isEmpty) {
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
