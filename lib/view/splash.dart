import 'dart:ui';

import 'package:flutter/material.dart';

import '../main.dart';
class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context   ) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(

        body: Center(

          child: Column(

            children: <Widget>[
              Image.asset('assets/splash_background.jpg'),
              SizedBox(height: 500),
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
          )
        )
      )
    );
    throw UnimplementedError();
  }

}