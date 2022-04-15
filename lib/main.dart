import 'package:bookspace/view/home.dart';
import 'package:bookspace/view/listing.dart';
import 'package:bookspace/view/login.dart';
import 'package:bookspace/view/postInspect.dart';
import 'package:bookspace/view/register.dart';
import 'package:bookspace/view/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dummy'),
          leading: BackButton(
            color: Colors.white,
          ),
        ),
        body: PostInspect(),
      ),

    );
  }
}

