import 'package:app_1/pages/profile.dart';
import 'package:app_1/pages/settings.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'onlineclass.dart';

class NavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  // Define a list of pages for each tab
  final List<Widget> _pages = [
    const DashPage(),
    ProfilePage(),
    SettingsPage(),
    // const OnlineClassPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Background color of the Scaffold
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
          color: Colors.transparent, // Transparent container to show background color
        ),
        child: CurvedNavigationBar(
          height: 50.0, // Reduced height for the navigation bar
          index: _currentIndex, // Set the initial selected index
          backgroundColor: Colors.transparent, // Transparent background
          color: Colors.blueAccent, // Main color of the navigation bar
          buttonBackgroundColor: Colors.blueAccent, // Highlight background color for the active button
          items: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the icon and text
              children: [
                Icon(
                  Icons.book,
                  size: 25,
                  color: _currentIndex == 0 ? Colors.white : Colors.black, // Make icon white when selected
                ),
                const SizedBox(height: 4), // Adjust spacing
                Text(
                  'Dashboard',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: _currentIndex == 0 ? Colors.white : Colors.black), // Make text white when selected
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the icon and text
              children: [
                Icon(
                  Icons.person,
                  size: 25,
                  color: _currentIndex == 1 ? Colors.white : Colors.black, // Make icon white when selected
                ),
                const SizedBox(height: 4), // Adjust spacing
                Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: _currentIndex == 1 ? Colors.white : Colors.black), // Make text white when selected
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the icon and text
              children: [
                Icon(
                  Icons.settings,
                  size: 25,
                  color: _currentIndex == 2 ? Colors.white : Colors.black, // Make icon white when selected
                ),
                const SizedBox(height: 4), // Adjust spacing
                Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: _currentIndex == 2 ? Colors.white : Colors.black), // Make text white when selected
                ),
              ],
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Update the selected index
            });
          },
        ),
      ),
    );
  }
}