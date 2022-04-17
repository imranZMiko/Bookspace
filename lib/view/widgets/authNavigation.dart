import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class AuthNavigation extends StatelessWidget {
  const AuthNavigation({
    Key? key,
    required this.headerText,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);
  final String headerText;
  final String buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(headerText),
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: const TextStyle(color: CustomColors.deepGreen),
            ),
          ),
        ],
      ),
    );
  }
}
