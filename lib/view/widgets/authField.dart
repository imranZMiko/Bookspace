import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField(
      {Key? key,
      required this.label,
      required this.isObscured,
      required this.isLast,
      required this.validator,
      this.controller,
      required this.onSaved})
      : super(key: key);
  final String label;
  final bool isObscured;
  final bool isLast;
  final String? Function(String) validator;
  final TextEditingController? controller;
  final void Function(String) onSaved;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: TextFormField(
          controller: controller,
          onSaved: (value){
            onSaved(value!);
          },
          textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
          validator: (value) {
            return validator(value!);
          },
          decoration: InputDecoration(
            labelText: label,
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
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
