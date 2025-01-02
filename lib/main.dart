import 'package:final_project/Route/app_page.dart';
import 'package:final_project/Route/app_route.dart';
import 'package:final_project/ui/screens/HomeScreen.dart';
import 'package:final_project/view_models/bookmarke_controller.dart';
import 'package:final_project/view_models/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
    Get.put(SearchControllerrr());
     Get.put(BookmarkController());
     await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: AppRoute.home,
     getPages: appPage,
    // home: HomeScreen(),
    );
  }
}
