import 'package:flutter/material.dart';
import 'package:shoppers/config/colors.dart';
import 'package:shoppers/widgets/widgets.dart';

Widget appButton({
  String? title,
  Function()? onTap,
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  double? horizontal,
  double? vertical,
  double? height
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: horizontal ?? 15, vertical: vertical ?? 6),
      child: Center(
        child:
        AppText.appText(text: title, color: AppColors.scaffoldColor,fontWeight: FontWeight.w500,fontSize: 17),
      ),
      decoration: BoxDecoration(
          color: AppColors.blueColor, borderRadius: BorderRadius.circular(10)),
      height: height ?? 48.0,
    ),
  );
}
