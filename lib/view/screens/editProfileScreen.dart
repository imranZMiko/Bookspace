import 'package:bookspace/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/userProvider.dart';

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
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 25, right: 25, bottom: 5),
                      child: Text(
                        Provider.of<UserProvider>(context, listen: false)
                            .currentUser
                            .getName(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
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
