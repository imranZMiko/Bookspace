import 'package:bookspace/view/screens/homeScreen.dart';
import 'package:bookspace/view/screens/newPostScreen.dart';
import 'package:bookspace/view/screens/profileScreen.dart';
import 'package:bookspace/view/screens/searchScreen.dart';
import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';
import '../widgets/newPostButton.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();

  static const String routeName = '/';
}

class _TabScreenState extends State<TabScreen> {
  late final List<Widget> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      const HomeScreen(),
      WillPopScope(
        child: const SearchScreen(),
        onWillPop: () async {
          _selectPage(0);
          return false;
        },
      ),
      WillPopScope(
        child: const HomeScreen(),
        onWillPop: () async {
          _selectPage(0);
          return false;
        },
      ),
      WillPopScope(
        child: const ProfileScreen(),
        onWillPop: () async {
          _selectPage(0);
          return false;
        },
      ),
      WillPopScope(
        child: const NewPostScreen(),
        onWillPop: () async {
          _selectPage(0);
          return false;
        },
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: CustomColors.lightGreen,
        child: SizedBox(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home_outlined,
                  color: _selectedPageIndex == 0 ? CustomColors.midGreen : Colors.black,
                  size: _selectedPageIndex == 0 ? 34 : 30,
                ),
                onPressed: () {
                  _selectPage(0);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.search_outlined,
                  color:  _selectedPageIndex == 1 ? CustomColors.midGreen : Colors.black,
                  size: _selectedPageIndex == 1 ? 34 : 30,
                ),
                onPressed: () {
                  _selectPage(1);
                },
              ),
              const SizedBox(
                width: 60,
              ),
              IconButton(
                icon: Icon(
                  Icons.chat_outlined,
                  color: _selectedPageIndex == 2 ? CustomColors.midGreen : Colors.black,
                  size: _selectedPageIndex == 2 ? 34 : 30,
                ),
                onPressed: () {
                  _selectPage(2);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle_outlined,
                  color:  _selectedPageIndex == 3 ? CustomColors.midGreen : Colors.black,
                  size: _selectedPageIndex == 3 ? 34 : 30,
                ),
                onPressed: () {
                  _selectPage(3);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: NewPostButton(
        buttonColor:
            _selectedPageIndex == 4 ? CustomColors.lightGreen : Colors.black,
        onPressed: () {
          _selectPage(4);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
