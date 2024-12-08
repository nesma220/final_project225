import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FillProfileController extends GetxController {
  var fullName = ''.obs;
  var nickname = ''.obs;
  var dateOfBirth = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var address = ''.obs;

  void updateFullName(String value) {
    fullName.value = value;
  }

  void updateNickname(String value) {
    nickname.value = value;
  }

  void updateDateOfBirth(String value) {
    dateOfBirth.value = value;
  }

  void updateEmail(String value) {
    email.value = value;
  }

  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
  }

  void updateAddress(String value) {
    address.value = value;
  }


  bool validateInputs() {
    if (fullName.isEmpty) {
      Get.snackbar("Error", "Full Name is required", backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      return false;
    }
    if (email.isEmpty) {
      Get.snackbar("Error", "Email is required", backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      return false;
    }
    if (phoneNumber.isEmpty) {
      Get.snackbar("Error", "Phone Number is required", backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      return false;
    }
    return true; // إذا كانت جميع المدخلات صحيحة
  }


  void submitProfile() {
    // هنا يمكنك إضافة الكود لمعالجة البيانات، مثل حفظها في قاعدة البيانات
    print("Full Name: ${fullName.value}");
    print("Nickname: ${nickname.value}");
    print("Date of Birth: ${dateOfBirth.value}");
    print("Email: ${email.value}");
    print("Phone Number: ${phoneNumber.value}");
    print("Address: ${address.value}");
  }
}