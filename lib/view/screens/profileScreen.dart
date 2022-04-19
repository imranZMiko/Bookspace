import 'package:bookspace/constants/custom_colors.dart';
import 'package:bookspace/constants/custom_navigator.dart';
import 'package:bookspace/providers/userProvider.dart';
import 'package:bookspace/view/screens/editProfileScreen.dart';
import 'package:bookspace/view/widgets/postCard.dart';
import 'package:bookspace/view/widgets/profileAvatar.dart';
import 'package:bookspace/view/widgets/profileButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 375,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: CustomColors.midGreen,
                  ),
                ),
                const Positioned(
                  left: -125,
                  top: -30,
                  child: CircleAvatar(
                    backgroundColor: CustomColors.transparentGreen,
                    radius: 120,
                  ),
                ),
                const Positioned(
                  left: -30,
                  top: -125,
                  child: CircleAvatar(
                    backgroundColor: CustomColors.transparentGreen,
                    radius: 120,
                  ),
                ),
                SizedBox(
                  height: 375,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfileAvatar(
                        size: 80,
                        img: NetworkImage(
                            Provider.of<UserProvider>(context, listen: false)
                                .currentUser
                                .getProfilePictureUrl()),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 375,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Welcome, ${Provider.of<UserProvider>(context, listen: false).currentUser.getName()}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: CustomColors.lightGreen,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProfileButton(
                              text: "Update Info",
                              onPressed: () {
                                CustomNavigator.pushWithoutAnimation(
                                    context, const EditProfileScreen());
                              }),
                          const SizedBox(
                            width: 15,
                          ),
                          ProfileButton(
                              text: "Log Out",
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                              }),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 5),
              child: Text(
                'Your posts',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                thickness: 2,
                color: Colors.black,
              ),
            ),
            Consumer<CatalogueProvider>(
              builder: (_, catalog, __) => FutureBuilder(
                future: catalog.getMyPosts(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.none) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: catalog.myPosts.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PostCard(
                        post: catalog.myPosts[index],
                      );
                    },
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
