import 'package:flutter/material.dart';

import 'my_theme.dart';

Widget inputBox(BuildContext context,
    {required FocusNode currentNode, required FocusNode nextNode}) {
  return Padding(
    padding: const EdgeInsets.all(4),
    child: Container(
      width: 72,
      height: 65,
      decoration: BoxDecoration(
        color: MyTheme.blueColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          focusNode: currentNode,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).requestFocus(nextNode);
            }
          },
        ),
      ),
    ),
  );
}
