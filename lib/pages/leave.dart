import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/5.jpg', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          // Main Content
          Column(
            children: [
              // AppBar
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                foregroundColor: Colors.white,
              ),
              Expanded(
                child: Stack(
                  children: [
                    // "Select" Text
                    const Padding(
                      padding: EdgeInsets.only(top: 70, left: 30),
                      child: Text(
                        'Leave\nRequest',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Buttons Container
                    Padding(
                      padding: const EdgeInsets.only(top: 300.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
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
                                  // Navigate to Hostel Leave Request page
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[300],
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Text(
                                  'Hostel Leave Request',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              const Gap(20),
                              ElevatedButton(
                                onPressed: () {
                                  // Navigate to Class Leave Request page
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[300],
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Text(
                                  'Class Leave Request',
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
            ],
          ),
        ],
      ),
    );
  }
}