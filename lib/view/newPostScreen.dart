import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: EdgeInsets.all(10.0),
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

}
