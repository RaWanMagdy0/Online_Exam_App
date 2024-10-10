import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogMethod{

  static Future<void> showErrorORWarningDialog({
    required BuildContext context,
    required String subtitle,
    required Function fct,
    bool isError = true,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image.asset(
                //   AssetsManager.warning,
                //   height: 60,
                //   width: 60,
                // ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                   subtitle,
                  style: const TextStyle(
                    fontSize: 20,
                  fontWeight: FontWeight.w600,
                  )
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !isError,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.green)
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        fct();
                        Navigator.pop(context);
                      },
                      child:Text(
                        "Ok",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color:  Colors.red
                        ),
                      )
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }








  static Future<void> showLoadingDialog({
    required BuildContext context,
  }) async {
    showDialog(
        context: context,
        builder: (context) =>
    const Center(child: CircularProgressIndicator()),);
  }

  static Future<void> showToast({
    required BuildContext context,
    required String massage,
  }) async {
    Fluttertoast.showToast(
        msg: massage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 18.0
    );
  }

}