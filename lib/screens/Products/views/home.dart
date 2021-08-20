import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers/config/colors.dart';
import 'package:shoppers/screens/Products/product.dart';

class Home extends StatelessWidget {
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: widgetBody(),
          bottomNavigationBar: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    productController.selectedIndex.value = 1;
                  },
                  child: Icon(
                    productController.selectedIndex.value == 1 ? Icons.home_filled : Icons.home_outlined,
                    color: AppColors.blueColor,
                    size: 30,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    productController.selectedIndex.value = 2;
                  },
                  child: Icon(
                    productController.selectedIndex.value == 2 ? Icons.shopping_cart_rounded : Icons.shopping_cart_outlined,
                    color: AppColors.blueColor,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget widgetBody() {
    if (productController.selectedIndex.value == 1) {
      return HomeScreen();
    } else {
      return Cart();
    }
  }
}
