import 'dart:ui';
import 'package:flutter/material.dart';

import '../../main.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splashScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                children: <Widget>[
                  Center(child: Image.asset('assets/splash_background.jpg')),
                  Center(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 600,
                        ),
                        SizedBox(
                          height: 50,
                          width: 250,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Register'),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: 250,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Login'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
