import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers/app.dart';
import 'package:shoppers/config/colors.dart';
import 'package:shoppers/screens/login/login.dart';
import 'package:shoppers/utils/popups.dart';
import 'package:shoppers/widgets/appText.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail(
      {this.productName,
      this.productImage,
      this.productDesc,
      this.productPrice});
  final productName;
  final productImage;
  final productDesc;
  final productPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.darkBlueColor,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColors.scaffoldColor,
        title: Text(
          productName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    productImage
                  ),
                  fit: BoxFit.fill,
                )
              ),
            ),
            SizedBox(
              height: 15,
            ),
            AppText.appText(
              text: productName,
              color: AppColors.blueColor,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            SizedBox(
              height: 10,
            ),
            AppText.appText(
              text: productDesc,
              color: AppColors.blackColor.withOpacity(0.5),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                AppText.appText(
                  text: "${'\$' + '$productPrice'}",
                  color: AppColors.blackColor.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    if (getStorage.read('isLogin') == "true") {
                      CommonPopup.showSnackbar(
                          message: 'Product Added Successfully!');
                    } else {
                      Get.offAll(SignUpScreen());
                    }
                  },
                  child: Icon(
                    Icons.add_circle,
                    color: AppColors.darkBlueColor,
                    size: 35,
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
