import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(height: 200,),
                const Text('Welcome Back!',
                  style:TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 35) ,),
                const SizedBox(height: 30,),
                emailField(),
                const SizedBox(height: 20,),
                passwordField(),
                SizedBox(height: 20,),
                submitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'you@example.com',
      ),
    );
  }

  Widget passwordField(){
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: '******',
      ),
      obscureText: true,
    );
  }

  Widget submitButton(){
    return ElevatedButton(onPressed: (){},
        child: Text('Login'));
  }
}
