import 'package:bookspace/constants/custom_colors.dart';
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

    Image image =
        await ImagePicker().pickImage(source: ImageSource.gallery) as Image;

    setState(() {
      isLoading = false;
    });

    // } on FirebaseException catch (err) {
    //   if (err.code == 'object-not-found') {
    //     await ref.putFile(imageFile).whenComplete(() => null);
    //
    //     setState(() {
    //       isLoading = false;
    //     });
    //   }
    // } catch (err) {
    //   print(err);
    //   ScaffoldMessenger.of(ctx).showSnackBar(
    //     SnackBar(
    //       content: Text(err.toString()),
    //       backgroundColor:
    //       Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
    //           ThemeMode.light
    //           ? Colors.teal[100]
    //           : Colors.teal[900],
    //     ),
    //   );
    //   print(err);
    // }
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
          const CircleAvatar(
            backgroundColor: CustomColors.darkGreen,
            radius: 77,
            child: CircleAvatar(
              backgroundImage: ExactAssetImage("assets/Naruto.webp"),
              radius: 75,
            ),
          ),
        if (!isLoading)
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: CustomColors.darkGreen,
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
