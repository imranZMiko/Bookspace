import 'package:bookspace/constants/custom_colors.dart';
import 'package:bookspace/constants/custom_navigator.dart';
import 'package:bookspace/view/screens/loginScreen.dart';
import 'package:bookspace/view/widgets/authButton.dart';
import 'package:bookspace/view/widgets/authField.dart';
import 'package:bookspace/view/widgets/authNavigation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = '/registerScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';

  void register() async {
    final isValid = _formKey.currentState!.validate();
    final _auth = FirebaseAuth.instance;
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState?.save();

      _username.trim();
      _email.trim();
      _password.trim();

      UserCredential userCredential;
      try {
        userCredential = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);

        final ref = FirebaseStorage.instance.ref().child('default_profile.jpg');

        final url = await ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set(
          {
            'username': _username,
            'email': _email,
            'image_url': url,
          },
        );

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
                  height: 120,
                ),
                const Text(
                  'Welcome Onboard!',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                const SizedBox(
                  height: 50,
                ),
                AuthField(
                  label: "Enter your full name",
                  isObscured: false,
                  isLast: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please provide an username";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _username = value;
                  },
                ),
                AuthField(
                  label: "Enter your email",
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
                  controller: _controller,
                  isObscured: true,
                  isLast: false,
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
                AuthField(
                  label: "Confirm password",
                  isObscured: true,
                  isLast: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password must be longer than 7 characters";
                    }
                    if (value != _controller.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                  onSaved: (_) {},
                ),
                AuthButton(
                  text: "Register",
                  onPressed: register,
                ),
                AuthNavigation(
                  headerText: "Already have an account?",
                  buttonText: "Log In",
                  onPressed: () {
                    CustomNavigator.replaceWithoutAnimation(
                        context, const LoginScreen());
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
