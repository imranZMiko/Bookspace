import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField(
      {Key? key,
      required this.label,
      required this.isObscured,
      required this.isLast})
      : super(key: key);
  final String label;
  final bool isObscured;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: TextFormField(
          textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
          decoration: InputDecoration(
            labelText: label,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
            labelStyle: TextStyle(fontSize: 14),
          ),
          obscureText: isObscured,
        ),
      ),
    );
  }
}
