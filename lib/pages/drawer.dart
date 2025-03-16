import 'package:app_1/pages/onlineclass.dart';
import 'package:app_1/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'navbar.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:20,bottom: 20),
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 350, // Set the desired height here
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>const ProfilePage()),
                    );
                  },
                  child: const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 90, // Set the radius as needed
                            backgroundImage: AssetImage('assets/images/img.jpg'), // Replace with your image asset
                          ),
                          SizedBox(height: 10), // Space between avatar and text
                          const Text(
                            'Anshu Kumar',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          const Text(
                            '12023002001020',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavigationPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text('Research'),
                onTap: () {
                  // Handle navigation or action here
                },
              ),
              ListTile(
                leading: const Icon(Icons.house),
                title: const Text('Academics'),
                onTap: () {
                  // Handle navigation or action here
                },
              ),
              ListTile(
                leading: const Icon(Icons.house),
                title: const Text('Digital Library'),
                onTap: () {
                  // Handle navigation or action here
                },
              ),
              ListTile(
                leading: const Icon(Icons.book_sharp),
                title: const Text('Course Enrollment'),
                onTap: () {
                  // Handle navigation or action here
                },
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Hostel'),
                onTap: () {
                  // Handle navigation or action here
                },
              ),
              const Divider(
                thickness: 1,
                color: Colors.black45,
                indent: 16.0,
                endIndent: 16.0,
              ),
              ListTile(
                leading: const Icon(Icons.contact_page),
                title: const Text('Contact us'),
                onTap: () {
                  // Handle navigation or action here
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log out'),
                onTap: () {
                  // Handle navigation or action here
                },
              ),
              ListTile(
                leading: const Icon(Icons.roundabout_left_rounded),
                title: const Text('About us'),
                onTap: () {
                  // Handle navigation or action here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}