import 'package:flutter/material.dart';
import 'package:online_exam100/core/utils/styles.dart';
class PromPtoWidget extends StatelessWidget {
  final String text;
  final String textButton;
  final void Function()? onPressed;
  const PromPtoWidget(
      {super.key,
      required this.text,
      required this.textButton,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font16GrayWeight400),
        TextButton(
          onPressed: onPressed,
          child: Text(textButton,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.font16BlueWeight500),
        ),
      ],
    );
  }
}
