import 'package:bookspace/view/widgets/postCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/catalogueProvider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = '/profileScreen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            const SizedBox(
              height: 150,
              width: 150,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/Naruto.webp'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Welcome, John Doe',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                  child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      child: const Text('Update Info'),
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      child: const Text('Logout'),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Your posts'),
            ),
            Consumer<CatalogueProvider>(
              builder: (_, catalog, __) => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
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
          ],
        ),
      ),
    );
  }
}
