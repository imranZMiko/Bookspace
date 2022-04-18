import 'package:bookspace/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({Key? key, required this.text, required this.onPressed}) : super(key: key);
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        minimumSize: const Size(280, 35),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 0,
      ).merge(
        ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all<Color>(CustomColors.deepGreen),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
