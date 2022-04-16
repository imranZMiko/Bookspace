import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Image _image = Image.asset('assets/Naruto.webp');
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            child:
              Column(
                children: [
                  Card(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _image,
                          IconButton(
                              icon: Icon(Icons.camera_alt_outlined),
                              onPressed: getImage
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'put current username here'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'enter current password'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'enter new password'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'confirm new password'
                      ),
                    ),
                  )
                ],
              ),

          ),
        ],
      ),
    );
  }
  Future getImage() async {
    Image image = ImagePicker().pickImage(source: ImageSource.gallery) as Image ;
    setState(() {
      this._image = image;
    });
  }
}
