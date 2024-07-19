import 'package:chat_gpt_app/components/colors.dart';
import 'package:chat_gpt_app/utils/extensions.dart';
import 'package:flutter/material.dart';

// -------- App Primary static textSyles ----------

class AppTextStyle {
  AppTextStyle._();

  static final fontSize28 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    color: whiteColor,
  );

  static final blackTextFontSize = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: blackTextColor,
  );

  static final whiteTextFontSize = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: whiteColor,
  );

  static final errorTextFontSize = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: errorColor,
  );

  static final appbarTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: whiteColor,
  );

  static final blackFontSize15 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: blackColor,
  );

  static final hintTextFontSize = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: hintTextColor,
  );

  static final appTextFontSize = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.appColor,
  );

  static final errorTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: errorColor,
  );
}
