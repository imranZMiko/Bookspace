import 'package:bookspace/constants/custom_colors.dart';
import 'package:bookspace/providers/userProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  bool isLoading = false;

  _imgFromGallery(BuildContext ctx) async {
    setState(() {
      isLoading = true;
    });

    final image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    var firebaseUser = FirebaseAuth.instance.currentUser;

    File imageFile = File(image!.path);

    final ref = FirebaseStorage.instance
        .ref()
        .child('user_image')
        .child(firebaseUser!.uid + '.jpg');

    try {
      await ref.putFile(imageFile).whenComplete(() => null);

      final url = await ref.getDownloadURL();

      final prevData = await FirebaseFirestore.instance
          .collection("users")
          .doc(firebaseUser.uid)
          .get();

      await FirebaseFirestore.instance
          .collection("users")
          .doc(firebaseUser.uid)
          .set(
        {
          'username': prevData.data()!['username'],
          'email': prevData.data()!['email'],
          'image_url' : url,
        },
      );

      await Provider.of<UserProvider>(context, listen: false).updateProfileImage();

      setState(() {
        isLoading = false;
      });
    }  catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isLoading)
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: CircleAvatar(
                child: CircularProgressIndicator(),
                radius: 75,
              ),
            ),
          ),
        if (!isLoading)
          CircleAvatar(
            backgroundColor: CustomColors.darkGreen,
            radius: 77,
            child: CircleAvatar(
              backgroundImage: NetworkImage(Provider.of<UserProvider>(context, listen: false)
                  .currentUser
                  .getProfilePictureUrl()),
              radius: 75,
            ),
          ),
        if (!isLoading)
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: CustomColors.deepGreen,
              child: IconButton(
                icon: const Icon(
                  Icons.edit,
                  size: 20,
                ),
                color: Colors.white,
                splashRadius: 18,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  _imgFromGallery(context);
                },
              ),
              radius: 18,
            ),
          ),
      ],
    );
  }
}
