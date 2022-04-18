import 'package:flutter/material.dart';

class CustomNavigator {
  static void pushWithoutAnimation(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, _, __) => screen,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static void replaceWithoutAnimation(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, _, __) => screen,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static void popAndReplaceWithoutAnimation(BuildContext context, Widget screen) {
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, _, __) => screen,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
    Navigator.pop(context);
  }
}
