import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam100/core/utils/app_colors.dart';

class TextStyles{
  static TextStyle font16Weight500 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kWhite,
  );

  static TextStyle  font16BlueWeight500 = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kBlue,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.kBlue,
  );



  static TextStyle  font16GrayWeight400 = GoogleFonts.inter(
  fontSize: 16.sp,
  fontWeight: FontWeight.w400,
  color: AppColors.kGray);

  static TextStyle font13BlackWeight400 =TextStyle(
      color: AppColors.kBlack,
      fontWeight: FontWeight.w400,
      fontSize: 13.sp,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.double);


    static TextStyle font14BlackWeight400 =
        TextStyle(
  color: AppColors.kBlack,
  fontWeight: FontWeight.w400,
  fontSize: 14.sp);



  static TextStyle font18BlackWeight600 =
  GoogleFonts.inter(
      color: AppColors.kBlack,
      fontWeight: FontWeight.w600,
      fontSize: 18.sp);


  static TextStyle font14GrayWeight400 =
  GoogleFonts.inter(
      color: AppColors.kGray,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp);




}