import 'package:app_1/pages/classschedule.dart';
import 'package:app_1/pages/payment.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:gap/gap.dart';
import 'attndncnavbar.dart';
import 'drawer.dart';
import 'leave.dart';
import 'onlineclass.dart';

class DashPage extends StatefulWidget {
  const DashPage({super.key});

  @override
  State<DashPage> createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  final PageController _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 0;
  final List<String> _images = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
  ];

  final List<Widget> _pages = [
    // AttendanceNavPage(),
    const OnlineClassPage(),
    const OnlineClassPage(),
    const OnlineClassPage(),
    const OnlineClassPage(),
    const OnlineClassPage(),
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        elevation: 32,
        width: 230,
        backgroundColor: Colors.black38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(15)),
        ),
        child: AppDrawer(),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/2.jpg', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.3), // Adds a semi-transparent overlay
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.blueAccent.withOpacity(0.8),
                title: const Text(
                  "Dashboard",
                  style: TextStyle(color:Colors.black,fontSize: 30, fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                leading: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Notifications"),
                            content: Text("You have no new notifications."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Close"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          SizedBox(
                            height: 200,
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: _images.length,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPage = index;
                                });
                              },
                              itemBuilder: (context, index) {
                                double scale = _currentPage == index ? 1.2 : 1.0;
                                return GestureDetector(
                                  onTap: () {
                                    // Navigate to the respective page based on image index
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => _pages[index],
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Transform.scale(
                                        scale: scale,
                                        child: Image.asset(
                                          _images[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              _images.length,
                                  (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                height: 8.0,
                                width: _currentPage == index ? 16.0 : 8.0,
                                decoration: BoxDecoration(
                                  color: _currentPage == index ? Colors.blueAccent : Colors.black,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(30),
                      // Attendance Widget
                      _buildAttendanceWidget(),
                      const SizedBox(height: 20),
                      const Divider(
                        thickness: 1,
                        color: Colors.black45,
                        indent: 16.0,
                        endIndent: 16.0,
                      ),
                      // Grid View
                      _buildGridView(),
                      const Gap(20),
                      const Divider(
                        thickness: 1,
                        color: Colors.black45,
                        indent: 16.0,
                        endIndent: 16.0,
                      ),
                      const Text('College app', style: TextStyle(color:Colors.black,fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceWidget() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AttendanceNavPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Attendance',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Theory', style: TextStyle(fontSize: 16)),
                  Text('64.75%', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 5),
              LinearProgressIndicator(
                value: 0.6475,
                color: Colors.yellow,
                backgroundColor: Colors.grey[300],
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Practical', style: TextStyle(fontSize: 16)),
                  Text('0.0%', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 5),
              LinearProgressIndicator(
                value: 0.0,
                color: Colors.red,
                backgroundColor: Colors.grey[300],
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Overall', style: TextStyle(fontSize: 16)),
                  Text('64.75%', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 5),
              LinearProgressIndicator(
                value: 0.6475,
                color: Colors.yellow,
                backgroundColor: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(8.0),
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: [
            _GridIconButton(icon: Icons.check_circle, label: 'Attendance', onPressed: () => _navigateToPage(context, 'Attendance')),
            _GridIconButton(icon: Icons.schedule, label: 'Class Schedule', onPressed: () => _navigateToPage(context, 'Class Schedule')),
            _GridIconButton(icon: Icons.online_prediction, label: 'Online Classes', onPressed: () => _navigateToPage(context, 'Online Classes')),
            _GridIconButton(icon: Icons.calendar_today, label: '     Exam\n  Timetable', onPressed: () => _navigateToPage(context, 'Exam Timetable')),
            _GridIconButton(icon: Icons.assignment, label: '     Exam\n  Hallticket', onPressed: () => _navigateToPage(context, 'Exam HallTicket')),
            _GridIconButton(icon: Icons.payment, label: 'Payment', onPressed: () => _navigateToPage(context, 'Payment')),
            _GridIconButton(icon: Icons.bar_chart, label: 'Result', onPressed: () => _navigateToPage(context, 'Result')),
            _GridIconButton(icon: Icons.assessment, label: 'Internal Mark', onPressed: () => _navigateToPage(context, 'Internal Mark')),
            _GridIconButton(icon: Icons.notes, label: 'My Notes', onPressed: () => _navigateToPage(context, 'My Notes')),
            _GridIconButton(icon: Icons.leave_bags_at_home, label: 'Leave Request', onPressed: () => _navigateToPage(context, 'Leave')),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, String pageName) {
    Widget page;
    switch (pageName) {
      case 'Attendance':
        page = AttendanceNavPage();
        break;
      case 'Class Schedule':
        page = const ClassSchedulePage(); // Replace with actual class
        break;
      case 'Online Classes':
        page = const OnlineClassPage(); // Replace with actual class
        break;
      case 'Exam Timetable':
        page = const OnlineClassPage(); // Replace with actual class
        break;
      case 'Exam HallTicket':
        page = const OnlineClassPage(); // Replace with actual class
        break;
      case 'Payment':
        page = const PaymentPage(); // Replace with actual class
        break;
      case 'Result':
        page = const OnlineClassPage(); // Replace with actual class
        break;
      case 'Internal Mark':
        page = const OnlineClassPage(); // Replace with actual class
        break;
      case 'My Notes':
        page = const OnlineClassPage(); // Replace with actual class
        break;
      case 'Leave':
        page = LeavePage(); // Replace with actual class
        break;
      default:
        page = const DashPage();
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

class _GridIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _GridIconButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: Colors.blueAccent),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}