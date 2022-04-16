import 'package:bookspace/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: CustomColors.lightGreen,
      child: SizedBox(
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            TabBarItem(icon: Icons.home),
            TabBarItem(icon: Icons.search),
            Expanded(child: Text("")),
            TabBarItem(icon: Icons.chat),
            TabBarItem(icon: Icons.account_circle),
          ],
        ),
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    Key? key, required this.icon
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        icon: Icon(
          icon,
          size: 30,
        ),
        onPressed: () {},
      ),
    );
  }
}
