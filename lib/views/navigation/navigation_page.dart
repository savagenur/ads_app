import 'package:ads_app/views/home/home_page.dart';
import 'package:ads_app/views/map/map_page.dart';
import 'package:ads_app/views/my_coupons/my_coupons_page.dart';
import 'package:ads_app/views/profile/profile_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) => setState(
          () => _currentIndex = value,
        ),
        items: _items,
      ),
    );
  }

  List<Widget> get _pages => [
        HomePage(),
        MapPage(),
        MyCouponsPage(),
        ProfilePage(),
      ];

  List<BottomNavigationBarItem> get _items => [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Акции",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.map,
          ),
          label: "Карта",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.discount,
          ),
          label: "Мои купоны",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: "Профиль",
        ),
      ];
}
