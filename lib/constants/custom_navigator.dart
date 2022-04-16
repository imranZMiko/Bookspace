import 'package:flutter/material.dart';

class CustomNavigator{
  static void pushWithoutAnimation(BuildContext context,Widget screen){
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, _, __) =>
        screen,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}