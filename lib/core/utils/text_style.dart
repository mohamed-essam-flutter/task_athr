import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_athr/core/colors/color.dart';
import 'package:task_athr/core/utils/font_manager.dart';

class TextStyles {
  static TextStyle font12PrimaryBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightManager.bold,
    color: Color(0xffffffff),
  );

  static TextStyle font14PrimarySemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightManager.semiBold,
    color: Color(0xff000000),
  );

   static TextStyle font14PrimaryRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightManager.regular,
    color: ColorManager.placeHolder,
  );

  static TextStyle font20PrimaryRegular = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightManager.regular,
    color: ColorManager.white
  );
  static TextStyle font20PrimaryBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightManager.bold,
    color: ColorManager.white
  );
   static TextStyle font20PrimarySemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightManager.semiBold,
    color: ColorManager.white
  );
   static TextStyle font16BlackBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightManager.bold,
    color: ColorManager.black
  );
  static TextStyle font16BlackSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightManager.semiBold,
    color: ColorManager.black
  );
    static TextStyle font16WhiteBoldButton = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightManager.bold,
    color: ColorManager.white
  );
   static TextStyle font16WhiteRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightManager.regular,
    color: ColorManager.white
  );
}