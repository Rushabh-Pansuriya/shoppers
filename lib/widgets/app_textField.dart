import 'package:flutter/material.dart';
import 'package:shoppers/config/colors.dart';
import 'package:shoppers/utils/textFiled_validation.dart';

Widget appTextFormField({
  String? hintText,
  TextInputType? keyboardType,
  int? maxLine,
  bool isShowEdit = false,
  TextEditingController? controller,
  bool isMargin = false,
  bool needValidation = false,
  String? validationMessage,
  bool isPasswordValidator = false,
  bool isEmailValidator = false,
  bool isNumberValidator = false,
  double? borderRadius,
  Function(String)? onChange,
  bool readOnly = false,
  int? maxLength,
  bool obscureText = false,
  double? horizontal,
  double? vertical,
  Widget? suffixIcon,
}) {
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: horizontal ?? 16, vertical: vertical ?? 6),
    child: TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: needValidation
          ? (value) => TextFieldValidation.validation(
              value: value,
              message: validationMessage,
              isEmailValidator: isEmailValidator,
              isPasswordValidator: isPasswordValidator)
          : null,
      maxLines: maxLine ?? 1,
      keyboardType: keyboardType ?? TextInputType.text,
      onChanged: onChange,
      maxLength: maxLength,
      readOnly: readOnly,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          counterText: '',
          filled: true,
          fillColor: AppColors.offWhiteColor,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? 6),
              ),
              borderSide: BorderSide(color: AppColors.offWhiteColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 6)),
              borderSide: BorderSide(color: AppColors.offWhiteColor)),
          errorBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 6)),
              borderSide: BorderSide(color: AppColors.offWhiteColor)),
          disabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 6)),
              borderSide: BorderSide(color: AppColors.offWhiteColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 6)),
              borderSide: BorderSide(color: AppColors.offWhiteColor)),
          hintText: hintText,
          suffixStyle: TextStyle(
            color: AppColors.blueColor.withOpacity(0.5),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: TextStyle(
            color: AppColors.greyColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          )),
      style: TextStyle(
        color: AppColors.greyColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
