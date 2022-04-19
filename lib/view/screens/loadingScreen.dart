import 'dart:ui';
import 'package:bookspace/constants/custom_navigator.dart';
import 'package:bookspace/view/screens/loginScreen.dart';
import 'package:bookspace/view/screens/registerScreen.dart';
import 'package:bookspace/view/widgets/authButton.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class LoadingScreen extends StatelessWidget {
  static const String routeName = '/loadingScreen';

  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/splash_background.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Bookspace",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  CircularProgressIndicator(strokeWidth: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
