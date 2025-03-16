import 'package:app_1/pages/dashboard.dart';
import 'package:app_1/pages/Signin_std.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'navbar.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Background
            Positioned.fill(
              child: Image.asset(
                'assets/images/2.jpg', // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: const Padding(
                padding: const EdgeInsets.only(top: 70, left: 30),
                child: Text(
                  'Select ',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Buttons Container
            Padding(
              padding: const EdgeInsets.only(top: 350.0),
              child: Container(
                decoration:  BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  // boxShadow: const [
                  //   BoxShadow(
                  //     offset: Offset(-15, 0),
                  //     blurRadius: 30,
                  //     spreadRadius: 3,
                  //     color: Colors.black,
                  //   ),
                  // ],
                ),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Gap(20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=> const SigninPage())
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          'Student',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const Gap(20),
                      ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          'Faculty',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const Gap(20),
                      ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          'Admin',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}