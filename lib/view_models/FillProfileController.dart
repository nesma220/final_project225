import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FillProfileController extends GetxController {
  var fullName = ''.obs;
  var nickname = ''.obs;
  var dateOfBirth = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var address = ''.obs;
  var profileImage = Rxn<Uint8List>(); // صورة الملف الشخصي

  // تحديث الحقول
  void updateFullName(String value) => fullName.value = value;
  void updateNickname(String value) => nickname.value = value;
  void updateDateOfBirth(String value) => dateOfBirth.value = value;
  void updateEmail(String value) => email.value = value;
  void updatePhoneNumber(String value) => phoneNumber.value = value;
  void updateAddress(String value) => address.value = value;

   // تحديث الصورة الشخصية
  void updateProfileImage(Uint8List image) {
    profileImage.value = image;
  }

  // التحقق من صحة البيانات
  bool validateFields() {
    if (fullName.value.isEmpty ||
        nickname.value.isEmpty ||
        dateOfBirth.value.isEmpty ||
        email.value.isEmpty ||
        phoneNumber.value.isEmpty ||
        address.value.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (!GetUtils.isEmail(email.value)) {
      Get.snackbar('Error', 'Please enter a valid email',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (phoneNumber.value.length < 8) {
      Get.snackbar('Error', 'Please enter a valid phone number',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    return true;
  }

  // إرسال البيانات
  void submitProfile() {
    if (validateFields()) {
      Get.snackbar('Success', 'Profile updated successfully',
          backgroundColor: Colors.green, colorText: Colors.white);
    }
  }
}



