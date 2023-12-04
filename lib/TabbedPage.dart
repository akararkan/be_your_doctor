import 'package:flutter/material.dart';
import 'Home.dart';
import 'Profile.dart';
import 'Search.dart';

class TabbedPage extends StatefulWidget {
  @override
  _TabbedPageState createState() => _TabbedPageState();
}

class _TabbedPageState extends State<TabbedPage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Be Your Doctor'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}