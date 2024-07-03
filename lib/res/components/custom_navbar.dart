import 'package:burger_crunch/Views/cart_view/cart_view.dart';
import 'package:burger_crunch/Views/favourite_view/favourite_view.dart';
import 'package:burger_crunch/Views/home_view/home_view.dart';
import 'package:burger_crunch/Views/profile_view/profile_view.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;
  final List _screen = [
    const HomeView(),
    const FavouriteView(),
    const CartView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        enableFeedback: true,
        fixedColor: Colors.black,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/nv1.png',
              color: Colors.orange,
            ),
            icon: Image.asset(
              'assets/images/nv1.png',
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/nv2.png',
              color: Colors.orange,
            ),
            icon: Image.asset('assets/images/nv2.png'),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/nv3.png',
              color: Colors.orange,
            ),
            icon: Image.asset('assets/images/nv3.png'),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/nv4.png',
              color: Colors.orange,
            ),
            icon: Image.asset('assets/images/nv4.png'),
            label: '',
          ),
        ],
      ),
      body: _screen[_selectedIndex],
    );
  }
}
