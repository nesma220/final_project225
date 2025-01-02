import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FillProfileController extends GetxController {
  var fullName = ''.obs;
  var nickname = ''.obs;
  var dateOfBirth = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var address = ''.obs;
  var profileImage = Rxn<Uint8List>(); // صورة الملف الشخصي

  @override
  void onInit() {
    super.onInit();
    loadProfileData(); // تحميل البيانات عند تهيئة الـ Controller
  }

Future<void> saveProfileData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('fullName', fullName.value);
  await prefs.setString('nickname', nickname.value);
  await prefs.setString('dateOfBirth', dateOfBirth.value);
  await prefs.setString('email', email.value);
  await prefs.setString('phoneNumber', phoneNumber.value);
  await prefs.setString('address', address.value);

  if (profileImage.value != null) {
    await prefs.setString('profileImage', String.fromCharCodes(profileImage.value!));
  }
  
  print('Data saved: Full Name = ${fullName.value}, Nickname = ${nickname.value}');
}

Future<void> loadProfileData() async {
  final prefs = await SharedPreferences.getInstance();
  fullName.value = prefs.getString('fullName') ?? '';
  nickname.value = prefs.getString('nickname') ?? '';
  dateOfBirth.value = prefs.getString('dateOfBirth') ?? '';
  email.value = prefs.getString('email') ?? '';
  phoneNumber.value = prefs.getString('phoneNumber') ?? '';
  address.value = prefs.getString('address') ?? '';

  String? imageData = prefs.getString('profileImage');
  if (imageData != null) {
    profileImage.value = Uint8List.fromList(imageData.codeUnits);
  }
  
  print('Data loaded: Full Name = ${fullName.value}, Nickname = ${nickname.value}');
}

  // تحديث الحقول
  void updateFullName(String value) {
    fullName.value = value;
    saveProfileData();
  }

  void updateNickname(String value) {
    nickname.value = value;
    saveProfileData();
  }

  void updateDateOfBirth(String value) {
    dateOfBirth.value = value;
    saveProfileData();
  }

  void updateEmail(String value) {
    email.value = value;
    saveProfileData();
  }

  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
    saveProfileData();
  }

  void updateAddress(String value) {
    address.value = value;
    saveProfileData();
  }

  void updateProfileImage(Uint8List image) {
    profileImage.value = image;
    saveProfileData();
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

  void submitProfile() {
    if (validateFields()) {
      Get.snackbar('Success', 'Profile updated successfully',
          backgroundColor: Colors.green, colorText: Colors.white);
    }
  }
}
