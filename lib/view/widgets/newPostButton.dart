import 'package:bookspace/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class NewPostButton extends StatelessWidget {
  const NewPostButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: CustomColors.deepGreen,
          tooltip: 'Increment',
          child: const Icon(
            Icons.add_circle,
            size: 30,
            color: Colors.black,
          ),
          elevation: 8.0,
        ),
      ),
    );
  }
}
