import 'package:bookspace/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class NewPostButton extends StatelessWidget {
  const NewPostButton({Key? key, required this.onPressed, required this.buttonColor}) : super(key: key);
  final void Function() onPressed;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: CustomColors.midGreen,
          tooltip: 'Increment',
          child: Icon(
            Icons.add_circle,
            size: 30,
            color: buttonColor,
          ),
          elevation: 8.0,
        ),
      ),
    );
  }
}
