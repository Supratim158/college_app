import 'package:flutter/material.dart';

import 'attendance.dart';
import 'onlineclass.dart';


class AttendanceNavPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<AttendanceNavPage> {
  int _currentIndex = 1;

  // Define a list of pages for each tab
  final List<Widget> _pages = [
    const OnlineClassPage(),
    const AttendancePage(),
    const OnlineClassPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color of the Scaffold
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0.0), // Padding around the navigation bar
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0.0), // Rounded corners
          child: BottomNavigationBar(
            backgroundColor: Colors.blueAccent, // Background color of the navigation bar
            selectedItemColor: Colors.white, // Color for the active item
            unselectedItemColor: Colors.black, // Color for inactive items
            currentIndex: _currentIndex, // Current selected index
            onTap: (index) {
              setState(() {
                _currentIndex = index; // Update the selected index
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle),
                label: 'Attendance',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}