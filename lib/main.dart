import 'package:bookspace/constants/custom_colors.dart';
import 'package:bookspace/providers/catalogueProvider.dart';
import 'package:bookspace/view/screens/editProfileScreen.dart';
import 'package:bookspace/view/screens/homeScreen.dart';
import 'package:bookspace/view/screens/tabScreen.dart';
import 'package:bookspace/view/widgets/postCard.dart';
import 'package:bookspace/view/screens/loginScreen.dart';
import 'package:bookspace/view/screens/newPostScreen.dart';
import 'package:bookspace/view/widgets/postInspect.dart';
import 'package:bookspace/view/screens/profileScreen.dart';
import 'package:bookspace/view/screens/register.dart';
import 'package:bookspace/view/screens/searchScreen.dart';
import 'package:bookspace/view/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CatalogueProvider()),
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
      initialRoute: TabScreen.routeName,
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        EditProfileScreen.routeName: (ctx) => const EditProfileScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        NewPostScreen.routeName: (ctx) => const NewPostScreen(),
        ProfileScreen.routeName: (ctx) => const ProfileScreen(),
        RegisterScreen.routeName: (ctx) => const RegisterScreen(),
        SplashScreen.routeName: (ctx) => const SplashScreen(),
        SearchScreen.routeName: (ctx) => const SearchScreen(),
        TabScreen.routeName: (ctx) => const TabScreen(),
      },
    );
  }
}
