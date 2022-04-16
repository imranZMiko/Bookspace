import 'package:bookspace/view/listing.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Listing> listOfListings = [
    Listing(),
    Listing(),
    Listing(),
    Listing(),
    Listing()
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: listOfListings.length,
        itemBuilder: (context, index){
          return listOfListings[index];
        },
      ),
    );
  }
}
