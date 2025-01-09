import 'package:final_project/Route/app_page.dart';
import 'package:final_project/Route/app_route.dart';
import 'package:final_project/ui/screens/HomeScreen.dart';
import 'package:final_project/ui/screens/login_screen_ready.dart';
import 'package:final_project/view_models/bookmarke_controller.dart';
import 'package:final_project/view_models/search_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  Get.put(SearchControllerrr());
  Get.put(BookmarkController());
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyCkB6UE250xPuU1fEpiTUknqoVbAZjETiA',
      appId: '1:133165871864:android:936b3696f18c67f57bc10d',
      messagingSenderId: '133165871864',
      projectId: 'final-project24-d6261',
    ),
  );

  runApp(const MyApp());
}




class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('==User is currently signed out!==');
      } else {
        print('===User is signed in!===');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splashScreen,
      getPages: appPage,
     home:FirebaseAuth.instance.currentUser == null ? LoginScreenReady() : HomeScreen(),
    );
  }
}
