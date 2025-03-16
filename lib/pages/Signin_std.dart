//import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui'; // for BackdropFilter
import 'navbar.dart';
import 'package:flutter/services.dart'; // For TextInputFormatter
import 'package:email_validator/email_validator.dart'; // For email validation

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _enrController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isRememberMeChecked = false;

  // Dropdown value
  String _userType = 'Student'; // Default value

  // Error message
  String? _enrollmentError;

  // Sign in method
  // void _signIn() async {
  //   if (_userType == 'Faculty') {
  //     // Show a pop-up for Faculty users
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Feature Coming Soon!'),
  //         content: Text(
  //           'The Faculty login feature is currently under development. Stay tuned for updates!',
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child:const Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   } else if (_enrController.text.isNotEmpty &&
  //       _passwordController.text.isNotEmpty) {
  //         String email = _emailController.text.trim();
  //         String password = _passwordController.text.trim();
  //     // Proceed to NavigationPage for Students
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  //     // Navigator.pushReplacement(
  //     //   context,
  //     //   MaterialPageRoute(builder: (context) => NavigationPage()),
  //     // );
  //   } else {
  //     // Show an error message if fields are empty
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Please fill in both fields')),
  //     );
  //   }
  //   Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => NavigationPage()),
  //     );
  // }

  void _signIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    // if (email.isNotEmpty && password.isNotEmpty) {
    //   await FirebaseAuth.instance
    //       .signInWithEmailAndPassword(email: email, password: password);
    // }
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationPage(),));
  }

  // Method to validate enrollment number or email
  String? _validateEnrOrEmail(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }

    // Check if it's a valid 14-digit number
    if (value.length == 14 && int.tryParse(value) != null) {
      return null; // Valid enrollment number
    }

    // Check if it's a valid Gmail email
    if (EmailValidator.validate(value) && value.endsWith('@gmail.com')) {
      return null; // Valid Gmail email
    }

    return 'Please enter a valid 14-digit number or Gmail address';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Blurry Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple.withOpacity(0.5),
                  Colors.blue.withOpacity(0.5),
                  Colors.pink.withOpacity(0.5),
                  Colors.purple.withOpacity(0.5),
                  Colors.red.withOpacity(0.5),
                  Colors.orange.withOpacity(0.5),
                  Colors.yellow.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          // Sign-In Form
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          offset: Offset(7, 15),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Enrollment Number or Email Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _enrController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enr no. / Email',
                              hintStyle: TextStyle(color: Colors.black54),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 20),
                            ),
                            style: TextStyle(
                                color: Colors.black), // Black text color
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp('[ ]')), // Deny spaces
                            ],
                            onChanged: (value) {
                              setState(() {
                                // Validate the input as the user types
                                _enrollmentError = _validateEnrOrEmail(value);
                              });
                            },
                          ),
                        ),
                        // Show error message if invalid
                        if (_enrollmentError != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              _enrollmentError!,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                        SizedBox(height: 20),
                        // Password Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black54),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 20),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            style: TextStyle(
                                color: Colors.black), // Black text color
                            textAlignVertical: TextAlignVertical
                                .center, // Centering text vertically
                          ),
                        ),
                        SizedBox(height: 20),
                        // Dropdown for Student/Faculty Selection
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: DropdownButtonFormField<String>(
                            value: _userType,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20), // Adjust padding if needed
                            ),
                            dropdownColor:
                            Colors.white, // Dropdown menu background color
                            icon:
                            Icon(Icons.arrow_drop_down, color: Colors.grey),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(
                                color: Colors
                                    .black), // Text color for selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                _userType = newValue!;
                              });
                            },
                            items: <String>['Student', 'Faculty']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      color: Colors
                                          .black), // Text color for options
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Remember Me Checkbox with Shadow
                        Container(
                          child: Row(
                            children: [
                              Checkbox(
                                value: _isRememberMeChecked,
                                onChanged: (value) {
                                  setState(() {
                                    _isRememberMeChecked = value!;
                                  });
                                },
                              ),
                              const Text(
                                "Remember me",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        // Sign In Button with Shadow
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 8,
                                offset: Offset(0, 7),
                              ),
                            ],
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _signIn,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 5,
                              ),
                              child: const Text(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
