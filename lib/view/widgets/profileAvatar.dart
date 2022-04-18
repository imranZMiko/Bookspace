import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key, required this.size}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: CustomColors.darkGreen,
      radius: size+2,
      child: CircleAvatar(
        backgroundImage: const ExactAssetImage("assets/Naruto.webp"),
        radius: size,
      ),
    );
  }
}
