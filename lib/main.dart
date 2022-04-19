import 'package:bookspace/constants/custom_colors.dart';
import 'package:bookspace/providers/catalogueProvider.dart';
import 'package:bookspace/providers/inboxProvider.dart';
import 'package:bookspace/providers/userProvider.dart';
import 'package:bookspace/view/screens/editProfileScreen.dart';
import 'package:bookspace/view/screens/homeScreen.dart';
import 'package:bookspace/view/screens/inboxScreen.dart';
import 'package:bookspace/view/screens/postDetailsScreen.dart';
import 'package:bookspace/view/screens/tabScreen.dart';
import 'package:bookspace/view/widgets/postCard.dart';
import 'package:bookspace/view/screens/loginScreen.dart';
import 'package:bookspace/view/screens/newPostScreen.dart';
import 'package:bookspace/view/widgets/postInspect.dart';
import 'package:bookspace/view/screens/profileScreen.dart';
import 'package:bookspace/view/screens/registerScreen.dart';
import 'package:bookspace/view/screens/searchScreen.dart';
import 'package:bookspace/view/screens/splashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/listing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CatalogueProvider()),
        ChangeNotifierProvider.value(value: InboxProvider()),
        ChangeNotifierProvider.value(value: UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bookspace:",
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: CustomColors.lightGreen,
          primary: CustomColors.lightGreen,
          surface: Colors.white,
          background: CustomColors.grayGreen,
          onPrimary: Colors.black,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: "Poppins",
            ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return const TabScreen();
          }
          return const SplashScreen();
        },
      ),
    );
  }
}
