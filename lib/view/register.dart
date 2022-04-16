import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()..onTap = (){
    debugPrint("go to login screen");
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: <Widget>[
              const Text('Welcome To Bookspace!',
                style:TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 30) ,),
              nameField(),
              emailField(),
              passwordField(),
              confirmPasswordField(),
              submitButton(),
              goToLoginPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameField(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,0.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: 'Name',
          hintText: 'John Doe',
        ),
      ),
    );
  }


  Widget emailField(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,0.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: 'Email',
          hintText: 'you@example.com',
        ),
      ),
    );
  }

  Widget passwordField(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,0.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: 'Password',
          hintText: '******',
        ),
        obscureText: true,
      ),
    );
  }
  Widget confirmPasswordField(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,0.0),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          labelText: 'Confirm Password',
          hintText: '******',
        ),
        obscureText: true,
      ),
    );
  }

  Widget submitButton(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0,60,10,0),
      child: SizedBox(
        width: 150,
        height: 40,
        child: ElevatedButton(onPressed: (){
          print('Pressed');
        },
            child: const Text(
              'Register',
               style: TextStyle(
                 fontSize: 20
                 )
              ,)
          ,),
      ),
    );
  }

  Widget goToLoginPage(){
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: 'Already have an account?  ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
            children: [
              TextSpan(
                text: 'Login',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),
                recognizer: _gestureRecognizer
              )
            ]
          ),
        ),
      ) ,
    );
  }
}
