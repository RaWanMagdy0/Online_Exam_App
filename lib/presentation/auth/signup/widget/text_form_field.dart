import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/my_theme.dart';

class TextFormFieldItem extends StatelessWidget {
  String hintText;
  String labelText;
  TextInputType keyBordType;
  TextEditingController controller;
  String? Function(String?)? validator;
  Widget? suffixIcon;
  Widget? prefixIcon;
  void Function(String)? onChanged;
  int? maxLine;
  bool isObscureText;

  TextFormFieldItem({
    required this.hintText,
    required this.labelText,
    this.keyBordType = TextInputType.none,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.isObscureText = false,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyBordType,
      obscureText: isObscureText,
      maxLines: maxLine,
      onChanged: onChanged,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey),
          floatingLabelStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.error)) {
              return TextStyle(color: MyTheme.redColor);
            } else if (states.contains(MaterialState.focused)) {
              return TextStyle(color: MyTheme.blackColor);
            }
            return TextStyle(color: Colors.grey);
          }),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: MyTheme.greyColor,
          ),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.blackColor, width: 1.0),
            borderRadius: BorderRadius.circular(3.r),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyTheme.blackColor, width: 1.0),
              borderRadius: BorderRadius.circular(3.r)),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyTheme.redColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyTheme.redColor,
            ),
          ),
          errorStyle: TextStyle(
            color: MyTheme.redColor,
            fontSize: 13.sp,
          )),
    );
  }
}
