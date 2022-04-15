import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(

          child: Column(
            children: <Widget>[
              const Text('Welcome Back!',
                style:TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 35) ,),
              emailField(),
              passwordField(),
              const SizedBox(height: 50,),
              submitButton(),
              goToRegisterPage()
            ],
          ),
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
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          labelText: 'Password',
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

  Widget goToRegisterPage(){
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: RichText(
          text: TextSpan(
              text: "Don't have an account?  ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
              children: [
                TextSpan(
                    text: 'Register',
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
