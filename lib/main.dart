import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_samaya/controller/auth_controller.dart';
import 'package:project_samaya/firebase_options.dart';
import 'view/bottom_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';

import 'view/user_authentication/user_login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
//       .then((value) => Get.put(AuthController()));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserLoginPage(),
    );
  }
}
