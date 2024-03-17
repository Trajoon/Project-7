import 'package:flutter/material.dart';
import 'package:projcet_cv/helper/extensions/assistant.dart';
import 'package:projcet_cv/views/Login/login_view.dart';

class CustomAlertDialog extends StatelessWidget {
  final String content;
  final VoidCallback? onPositivePressed;

  CustomAlertDialog({
    required this.content,
    this.onPositivePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            if (onPositivePressed != null) {
              onPositivePressed!();
            }
            context.push(context, LoginView());
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
