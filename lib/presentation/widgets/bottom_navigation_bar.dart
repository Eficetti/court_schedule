import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return CircleNavBar(
      activeIcons: const [
        Icon(Icons.add, color: Color(0xffDB162F)),
        Icon(Icons.home, color: Color(0xffDB162F)),
      ],
      inactiveIcons: const [
        Icon(Icons.add, color: Colors.grey),
        Icon(Icons.home, color: Colors.grey),
      ],
      color: Colors.white,
      circleColor: Colors.white,
      height: 40,
      circleWidth: 40,
      activeIndex: index,
      onTap: (index) {
        switch (index) {
          case 1:
            Navigator.of(context).pushReplacementNamed('/');
          case 0:
            Navigator.of(context).pushReplacementNamed('/reserve');
        }
      },
      cornerRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      elevation: 10,
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Color(0xffB5FFE9), Color(0xffC5E0D8)],
      ),
      circleGradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Color(0xffB5FFE9), Color(0xffC5E0D8)],
      ),
    );
  }
}
