import 'package:bookspace/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/catalogueProvider.dart';
import '../widgets/postCard.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = '/searchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Constants.toolbarHeight + 16,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Search",
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.search,
                size: 25,
              ),
            ),
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: Consumer<CatalogueProvider>(
        builder: (_, catalog, __) => ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: catalog.catalogueList.length,
          itemBuilder: (context, index) {
            return PostCard(
              post: catalog.catalogueList[index],
            );
          },
        ),
      ),
    );
  }
}
