import 'package:flutter/material.dart';

import 'class/class_page.dart';
import 'home/home_page.dart';
import 'store/store_page.dart';
import 'user/user_page.dart';

class MenuBar_Page extends StatefulWidget {
  const MenuBar_Page({super.key});

  @override
  State<MenuBar_Page> createState() => _MenuBar_PageState();
}

class _MenuBar_PageState extends State<MenuBar_Page> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Class_Page(),
    Text(
      'Index 1: Chat',
      style: optionStyle,
    ),
    Home_Page(),
    Store_page(),
    User_page(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_outline,
            ),
            label: 'Lớp',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline,
            ),
            label: 'Tin nhắn',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop_outlined,
            ),
            label: 'Cửa hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Hồ sơ',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(23, 161, 250, 1),
        unselectedItemColor: const Color.fromRGBO(149, 149, 149, 1),
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
