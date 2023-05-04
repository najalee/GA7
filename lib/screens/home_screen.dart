import 'dart:developer';
import 'package:charity_app/screens/addPost_screen.dart';
import 'package:charity_app/screens/profile_screen.dart';
import 'package:charity_app/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  // final tabs = [
  //   Center(child: Text('Home')),
  //   Center(child: Text('Search')),
  //   AddPostScreen(),
  //   Center(child: Text('Profile')),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          Center(child: Text('Home')),
          Center(child: Text('Search')),
          Center(child: Text('Add Post')),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // selectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, color: Colors.white),
              label: 'Home',
              backgroundColor: Color(0xFFF29100)),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.white),
              label: 'Search',
              backgroundColor: Color(0xFFF29100)),
          BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.white),
              label: 'Add',
              backgroundColor: Color(0xFFF29100)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white),
              label: 'Person',
              backgroundColor: Color(0xFFF29100)),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
