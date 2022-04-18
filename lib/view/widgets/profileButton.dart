import 'package:bookspace/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key, required this.text, required this.onPressed}) : super(key: key);
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        minimumSize: const Size(160, 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 0,
      ).merge(
        ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all<Color>(CustomColors.lightGreen),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          color: CustomColors.deepGreen,
        ),
      ),
    );
  }
}
