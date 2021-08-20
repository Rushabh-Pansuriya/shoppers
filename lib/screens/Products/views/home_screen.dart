import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers/app.dart';
import 'package:shoppers/config/colors.dart';
import 'package:shoppers/screens/Products/product.dart';
import 'package:shoppers/screens/login/login.dart';
import 'package:shoppers/utils/popups.dart';
import 'package:shoppers/widgets/appText.dart';

class HomeScreen extends StatelessWidget {
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColors.scaffoldColor,
        title: Text(
          'Shoppers',
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
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.8),
                itemBuilder: (BuildContext context, index) {
                  return products(
                      imageUrl: productController.productImage[index],
                      productName: productController.productName[index],
                      productDecs: productController.productDesc[index],
                      price: productController.productPrice[index],
                      productDetails: () {
                        Get.to(() => ProductDetail(
                              productImage:
                                  productController.productImage[index],
                              productName: productController.productName[index],
                              productDesc: productController.productDesc[index],
                              productPrice:
                                  productController.productPrice[index],
                            ));
                        getStorage.erase();
                      },
                      addProduct: () {
                        if (getStorage.read('isLogin') == "true") {
                          CommonPopup.showSnackbar(
                              message: 'Product Added Successfully!');
                        } else {
                          Get.offAll(SignUpScreen());
                        }
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget products({
    String? imageUrl,
    String? productName,
    String? productDecs,
    String? price,
    Function()? addProduct,
    Function()? productDetails,
  }) {
    return GestureDetector(
      onTap: productDetails,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(imageUrl ?? ''),
                  )),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: AppColors.offWhiteColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  AppText.appText(
                      text: productName,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.blueColor,
                      maxLines: 1),
                  SizedBox(
                    height: 3,
                  ),
                  AppText.appText(
                      text: productDecs,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.blackColor.withOpacity(0.5),
                      maxLines: 1),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      AppText.appText(
                          text: "${'\$' + '$price'}",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.blackColor.withOpacity(0.5),
                          maxLines: 1),
                      Spacer(),
                      GestureDetector(
                        onTap: addProduct,
                        child: Icon(
                          Icons.add_circle,
                          color: AppColors.darkBlueColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
