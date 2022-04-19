import 'package:bookspace/constants/custom_navigator.dart';
import 'package:bookspace/view/screens/registerScreen.dart';
import 'package:bookspace/view/widgets/authButton.dart';
import 'package:bookspace/view/widgets/authNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/custom_colors.dart';
import '../widgets/authField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  String _email = '';
  String _password = '';

  void login() async {
    final isValid = _formKey.currentState!.validate();
    final _auth = FirebaseAuth.instance;
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState?.save();

      _email.trim();
      _password.trim();

      try {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);

        Navigator.of(context).pop();
      } on PlatformException catch (err) {
        var message = 'An error occurred';

        if (err.message != null) {
          message = err.message!;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      } on FirebaseAuthException catch (err) {
        var message = 'An error occurred';

        if (err.message != null) {
          message = err.message!;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      } catch (err) {
        print(err);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.gray,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                const SizedBox(
                  height: 50,
                ),
                AuthField(
                  label: "Enter your email",
                  controller: _controller,
                  isObscured: false,
                  isLast: false,
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return "Please provide a valid email";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                AuthField(
                  label: "Enter password",
                  isObscured: true,
                  isLast: true,
                  validator: (value) {
                    if (value.isEmpty || value.length < 7) {
                      return "Password must be longer than 7 characters";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                AuthButton(
                  text: "Log In",
                  onPressed: login,
                ),
                AuthNavigation(
                  headerText: "Forgot your password?",
                  buttonText: "Click here",
                  onPressed: () {
                    FirebaseAuth.instance.sendPasswordResetEmail(email: _controller.text);
                  },
                ),
                AuthNavigation(
                  headerText: "New to Bookspace?",
                  buttonText: "Register",
                  onPressed: () {
                    CustomNavigator.replaceWithoutAnimation(
                        context, const RegisterScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
