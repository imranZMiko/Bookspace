import 'dart:ui';
import 'package:flutter/material.dart';

import '../main.dart';
class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context   ) {
    // TODO: implement build
    return MaterialApp(
      title: 'Splash',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(

        body: Center(

          child: Stack(
            children: <Widget>[
              Center(child: Image.asset('assets/splash_background.jpg')),
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 600,),
                    SizedBox(height: 50, width: 250,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text('Register'),
                      ),),
                    SizedBox(height: 20,),
                    SizedBox(height: 50, width: 250,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text('Login'),
                      ),),

                  ],
                ),
              )
            ],
          )
        )
      )
    );
    throw UnimplementedError();
  }

}