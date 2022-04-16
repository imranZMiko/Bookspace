import 'package:bookspace/view/listing.dart';
import 'package:flutter/material.dart';
import '';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Listing> listOfListings = [
    Listing(),
    Listing(),
    Listing(),
    Listing(),
    Listing()
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/Naruto.webp'),

          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Welcome, John Doe',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(

                  child: Text('Update Info'),
                  onPressed: (){},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  child: Text('Logout'),
                  onPressed: (){},
                ),
              ),
            ),

          ],
        ),
        Divider(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Your posts'),
        ),

        Expanded(
          child: Center(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listOfListings.length,
              itemBuilder: (context, index){
                return listOfListings[index];
              },
            ),
          ),
        )
      ],
    );
  }
}
