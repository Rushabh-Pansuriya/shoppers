import 'package:get/get.dart';

class CommonPopup {
  static showSnackbar({String? message}) {
    Get.snackbar(
      'Shoppers',
      "$message",
      snackPosition: SnackPosition.TOP,
      duration: Duration(
        seconds: 2,
      ),
    );
  }
}