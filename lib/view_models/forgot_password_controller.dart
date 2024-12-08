import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  // Observable variables
  var selectedOption = ''.obs;

  // Functions to update state
  void updateSelectedOption(String option) {
    selectedOption.value = option;
  }
}
