import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/4.jpg'), // Path to your background image
                  fit: BoxFit.cover, // Ensure the image covers the entire screen
                  alignment: Alignment.center, // Center the image
                ),
              ),
            ),
          ),
          // Column to hold AppBar and profile content
          Column(
            children: [
              // AppBar
              AppBar(
                backgroundColor: Colors.transparent, // Make app bar background transparent
                elevation: 0,
                automaticallyImplyLeading: false,
                title: const Padding(
                  padding: EdgeInsets.only(left: 130),
                  child: Row(
                    children: [
                      Text(
                        "Profile",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      _showEditDialog(context);
                    },
                  ),
                ],
              ),
              // Content on top of the background and AppBar
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 20), // Ensure padding from app bar
                    child: Column(
                      children: [
                        // Avatar with shadow
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 15,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 80,
                            backgroundImage: AssetImage('assets/images/img.jpg'),
                          ),
                        ),
                        const Gap(20),
                        const Text(
                          "Anshu Kumar",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "12023002001004",
                          style: TextStyle(color: Colors.white),
                        ),
                        Gap(50),
                        Text(
                          "Information",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 15),

                        // Email
                        _buildInfoTile(context, 'Email', 'anshu.kumar@example.com', CupertinoIcons.mail),
                        Gap(20),

                        // Branch
                        _buildInfoTile(context, 'Branch', 'Computer Science', CupertinoIcons.building_2_fill),
                        Gap(20),

                        // User ID
                        _buildInfoTile(context, 'User ID', '12023002001004', CupertinoIcons.person),
                        Gap(20),

                        // Last Sign In
                        _buildInfoTile(context, 'Last Sign In', '12th November 2023, 10:30 AM', CupertinoIcons.time),
                        Gap(20),

                        // Account Created On
                        _buildInfoTile(context, 'Account Created On', '5th October 2023', CupertinoIcons.calendar),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to create an information tile with consistent styling
  Widget _buildInfoTile(BuildContext context, String title, String subtitle, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.black.withOpacity(.5),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title, style: TextStyle(color: Colors.black)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.black)),
        leading: Icon(icon, color: Colors.black),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey),
      ),
    );
  }

  // Show edit dialog for email and user ID
  void _showEditDialog(BuildContext context) {
    final emailController = TextEditingController(text: 'anshu.kumar@example.com');
    final userIdController = TextEditingController(text: '12023002001004');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Profile"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(CupertinoIcons.mail),
                ),
              ),
              Gap(20),
              TextField(
                controller: userIdController,
                decoration: InputDecoration(
                  labelText: 'User ID',
                  prefixIcon: Icon(CupertinoIcons.person),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog without saving
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Save the new values
                // Update the UI as needed
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}