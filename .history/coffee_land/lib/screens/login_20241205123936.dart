import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignInScreen());
  }
}

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xFFF5EDE0,
      ), // Background color similar to the design
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Coffee Bean Logo
              Image.asset(
                'assets/icons/coffee_beans.png', // Replace with the coffee bean icon asset
                height: 100,
              ),
              SizedBox(height: 20),
              // "Sign-In" Text
              Text(
                "Sign-In",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[700],
                ),
              ),
              SizedBox(height: 40),
              // Username Input
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    'assets/icons/user_icon.png',
                  ), // Replace with user icon asset
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.brown[400]),
                  filled: true,
                  fillColor: Color(0xFFFFE0B2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Password Input
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    'assets/icons/password_icon.png',
                  ), // Replace with password icon asset
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.brown[400]),
                  filled: true,
                  fillColor: Color(0xFFFFE0B2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Sign-In Button
              ElevatedButton(
                onPressed: () {
                  // Handle Sign-In logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8B5E3C), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                child: Text(
                  "Sign-In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Sign-Up Prompt
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.brown[400]),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Sign-Up screen
                    },
                    child: Text(
                      "Sign-up",
                      style: TextStyle(
                        color: Color(0xFF8B5E3C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
