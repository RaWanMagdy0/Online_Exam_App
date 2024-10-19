import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam/core/styles/colors/app_colors.dart';
import 'package:online_exam/core/styles/fonts/app_fonts.dart';
import 'package:online_exam/core/styles/images/app_images.dart';

class AppDialogs{


  static Future<void>showLoading({
    required BuildContext context,
  }){
    return showDialog(
        context: context,
        builder: (context) {
      return  Lottie.asset(
        AppImages.loading,
        height: 10.h,
        width: 10.w,
      );
        });
  }




  static void showErrorDialog({
    required BuildContext context,
    required String errorMassage
}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.kWhite,
        icon:  Lottie.asset( AppImages.error,
        width:70.w,
        height: 50.h
        ),
        content: Text(
          textAlign: TextAlign.center,
          errorMassage,
          style: AppFonts.font18BlackWeight600,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Got it',
              style: AppFonts.font16GrayWeight400,
            ),
          ),
        ],
      ),
    );
  }
  }