import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;  // حفظ الـ index الحالي

  void changeTabIndex(int index) {
    selectedIndex.value = index;  // تغيير الـ index عند النقر
  }
}



