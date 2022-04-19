import 'package:bookspace/view/widgets/contactButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../providers/userProvider.dart';
import '../widgets/profileAvatar.dart';
import 'dart:io';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);
  static const String routeName = '/newPostScreen';

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  String dropDownValue = 'Sell';
  List<String> listingType = ['Sell', 'Share', 'Request'];
  File? _image;
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _author = "";
  String _condition = "";
  String _genre = "";
  double _price = -1;
  String _description = "";

  void newPost() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (_image == null && dropDownValue != "Request") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please add an image")));
      return;
    }
    if (isValid) {
      _formKey.currentState?.save();

      _name.trim();
      _author.trim();
      _condition.trim();
      _genre.trim();
      _description.trim();

      try {
        final ref = await FirebaseFirestore.instance.collection("posts").add({
          "email": Provider.of<UserProvider>(context, listen: false)
              .currentUser
              .getEmail(),
          "type": dropDownValue,
          "image": "",
          "name": _name,
          "author": _author,
          "condition": _condition,
          "genre": _genre,
          "price": _price,
          "description": _description,
          "createdAt": Timestamp.now(),
        });

        final imageRef = FirebaseStorage.instance
            .ref()
            .child('post_image')
            .child(ref.id + '.jpg');

        try {
          await imageRef.putFile(_image!).whenComplete(() => null);

          final url = await imageRef.getDownloadURL();

          ref.update({
            "image": url,
          });
        } catch (err) {
          print(err);
        }

        setState(() {
          _formKey.currentState?.reset();
          _image = null;
          dropDownValue = "Sell";
          _name = "";
          _author = "";
          _condition = "";
          _genre = "";
          _price = -1;
          _description = "";
        });


      } catch (err) {
        print(err);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("New Post"),
        elevation: 0,
        toolbarHeight: 65,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 20),
                  child: Row(
                    children: [
                      ProfileAvatar(
                        size: 30,
                        img: NetworkImage(
                            Provider.of<UserProvider>(context, listen: false)
                                .currentUser
                                .getProfilePictureUrl()),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 0),
                        child: Text(
                          Provider.of<UserProvider>(context, listen: false)
                              .currentUser
                              .getName(),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(5),
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    underline: const SizedBox(),
                    value: dropDownValue,
                    onChanged: (newValue) {
                      setState(() {
                        dropDownValue = newValue as String;
                      });
                    },
                    items: listingType.map((e) {
                      return DropdownMenuItem<String>(
                        value: e.toString(),
                        child: Text(e.toString()),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if(dropDownValue != "Request")
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: Colors.black54, width: 0.5),
                  ),
                  child: SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_image != null)
                          SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: Image.file(
                              _image!,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        IconButton(
                          icon: const Icon(Icons.camera_alt_outlined),
                          onPressed: getImage,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Name of the book',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please provide the name of the book";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Author',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please provide the name of the author";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _author = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Condition',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please provide the condition of the book";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _condition = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Genre',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    onSaved: (value) {
                      if (value == null) {
                        _genre = "";
                        return;
                      }
                      _genre = value;
                    },
                  ),
                ),
                if (dropDownValue == "Sell")
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: TextFormField(
                      key: const ValueKey("price"),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Price',
                        hintStyle: TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please provide the book's price";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _price = double.parse(value!.trim());
                      },
                    ),
                  ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextFormField(
                    minLines: 8,
                    maxLines: 20,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    onSaved: (value) {
                      if (value == null) {
                        _description = "";
                        return;
                      }
                      _description = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ContactButton(text: "Submit", onPressed: newPost),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    final image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    File imageFile = File(image!.path);

    setState(() {
      _image = imageFile;
    });
  }
}
