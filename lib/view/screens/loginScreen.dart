import 'package:bookspace/constants/custom_navigator.dart';
import 'package:bookspace/view/screens/homeScreen.dart';
import 'package:bookspace/view/screens/register.dart';
import 'package:bookspace/view/widgets/authButton.dart';
import 'package:bookspace/view/widgets/authNavigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';
import '../widgets/authField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.gray,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150,),
                const Text('Welcome Back!',
                  style:TextStyle(fontWeight: FontWeight.w600,
                      fontSize: 18) ,),
                const SizedBox(height: 50,),
                const AuthField(label: "Enter your email", isObscured: false, isLast: false),
                const AuthField(label: "Enter password", isObscured: true, isLast: true),
                const SizedBox(height: 50,),
                AuthButton(text: "Log In", onPressed: (){
                  CustomNavigator.replaceWithoutAnimation(context, const HomeScreen());
                }),
                AuthNavigation(headerText: "New to Bookspace?", buttonText: "Register", onPressed: (){
                  CustomNavigator.replaceWithoutAnimation(context, const RegisterScreen());
                },),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
