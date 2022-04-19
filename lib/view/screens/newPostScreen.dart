
import 'package:bookspace/view/widgets/contactButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/profileAvatar.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);
  static const String routeName = '/newPostScreen';

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  String dropDownValue = 'Sell';
  List<String> listingType = ['Sell', 'Share', 'Request'];
  Image _image = const Image(
    image: AssetImage('assets/addImage.png'),
    height: 150,
    width: 150,
  );

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 20),
                child: Row(
                  children: const [
                    ProfileAvatar(
                      size: 30,
                      img: ExactAssetImage("assets/Naruto.webp"),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child: Text(
                        "John Doe",
                        style: TextStyle(fontSize: 18),
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
                      IconButton(
                        icon: const Icon(Icons.camera_alt_outlined),
                        onPressed: getImage,
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Name of the book',
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Author',
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Condition',
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Genre',
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: TextField(
                  minLines: 8,
                  maxLines: 20,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              ContactButton(text: "Submit", onPressed: (){}),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    Image image = ImagePicker().pickImage(source: ImageSource.gallery) as Image;
    setState(() {
      _image = image;
    });
  }
}
