import 'package:flutter/material.dart';

class AppText {
  static appText({Function()? onTap,String? text,Color? color, double? fontSize,FontWeight? fontWeight,int? maxLines,TextAlign? textAlign}) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text ?? '',
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines ?? 2,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
        ),
      ),
    );
  }
}
