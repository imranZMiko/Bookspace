import 'package:bookspace/constants/custom_colors.dart';
import 'package:bookspace/constants/custom_navigator.dart';
import 'package:bookspace/view/screens/homeScreen.dart';
import 'package:bookspace/view/screens/loginScreen.dart';
import 'package:bookspace/view/screens/tabScreen.dart';
import 'package:bookspace/view/widgets/authButton.dart';
import 'package:bookspace/view/widgets/authField.dart';
import 'package:bookspace/view/widgets/authNavigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = '/registerScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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
                const SizedBox(height: 120,),
                const Text(
                  'Welcome Onboard!',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                const SizedBox(height: 50,),
                const AuthField(label: "Enter your full name", isObscured: false, isLast: false),
                const AuthField(label: "Enter your email", isObscured: false, isLast: false),
                const AuthField(label: "Enter password", isObscured: true, isLast: false),
                const AuthField(label: "Confirm password", isObscured: true, isLast: true),
                AuthButton(text: "Register", onPressed: (){
                  CustomNavigator.popAndReplaceWithoutAnimation(context, const TabScreen());
                }),
                AuthNavigation(headerText: "Already have an account?", buttonText: "Log In", onPressed: (){
                  CustomNavigator.replaceWithoutAnimation(context, const LoginScreen());
                },),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
