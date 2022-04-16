import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  String dropDownValue = "" ;
  List listingType =[
    'Sell',
    'Share',
    'Request'
  ];
  Image _image = Image(image: AssetImage('assets/addImage.png'), height: 150, width: 150,);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.white70,
              title: Text('Name of posting guy'),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/Naruto_newshot.webp'),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: DropdownButton(
          //     value: dropDownValue,
          //     onChanged: (newValue){
          //       setState(() {
          //         dropDownValue = newValue;
          //       });
          //     },
          //     items: listingType.map((e) {
          //       return DropdownMenuItem<String>(
          //         value: e.toString(),
          //         child: Text(e.toString()),
          //       );
          //     }).toList(),
          //   ),
          // ),
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
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Name of the book'
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Author'
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Condition'
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Genre'
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Description'
              ),
            ),
          )

        ],
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
