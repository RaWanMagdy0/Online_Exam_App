import 'package:flutter/material.dart';
import 'package:online_exam100/core/utils/styles.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {
            value != value;
          },
        ),
        Text("Remember me", style: TextStyles.font14BlackWeight400),
      ],
    );
  }
}
