import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key, required this.size, required this.img}) : super(key: key);
  final double size;
  final ImageProvider img;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: CustomColors.darkGreen,
      radius: size+2,
      child: CircleAvatar(
        backgroundImage: img,
        backgroundColor: Colors.white,
        radius: size,
      ),
    );
  }
}
