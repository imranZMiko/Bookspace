import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);
  static const String routeName = '/newPostScreen';

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  String dropDownValue = 'Sell' ;
  List<String> listingType = [
    'Sell',
    'Share',
    'Request'
  ];
  Image _image = const Image(image: AssetImage('assets/addImage.png'), height: 150, width: 150,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookspace"),
        elevation: 0,
        toolbarHeight: 65,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.white70,
                title: Text('Name of posting guy'),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/Naruto.webp'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DropdownButton(
                value: dropDownValue,
                onChanged: (newValue){
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
            Card(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _image,
                    IconButton(
                        icon: const Icon(Icons.camera_alt_outlined),
                        onPressed: getImage
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Name of the book'
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Author'
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Condition'
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Genre'
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Description'
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  Future getImage() async {
    Image image = ImagePicker().pickImage(source: ImageSource.gallery) as Image ;
    setState(() {
      _image = image;
    });
  }

}
