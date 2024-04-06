import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt CurrentTab = 0.obs;

  void changeIndex(int index) {
    CurrentTab.value = index;
  }
}
