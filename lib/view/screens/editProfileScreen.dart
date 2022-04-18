import 'package:bookspace/view/widgets/contactButton.dart';
import 'package:bookspace/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  static const String routeName = '/editProfile';
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        elevation: 0,
        toolbarHeight: 65,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const ProfileImage(),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 15, left: 25, right: 25, bottom: 5),
                      child: Text(
                        'Username',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ContactButton(text: "Change Username", onPressed: () {}),
                    const SizedBox(height: 20),
                    ContactButton(text: "Change Password", onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
