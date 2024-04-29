import 'package:get/get.dart';

class ThemeModeController extends GetxController {
  final rxIsDarkMode = false.obs;

  void toggleThemeMode() {
    rxIsDarkMode.value = rxIsDarkMode.value == true ? false : true;
  }
}
