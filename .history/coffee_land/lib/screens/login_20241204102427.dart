import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignInPage extends StatelessWidget {
  void signIn(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/signin'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      print('Sign-in successful!');
    } else {
      print('Sign-in failed: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EDE2), // Background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Coffee bean logo (Placeholder)
              Icon(Icons.coffee_rounded, size: 100, color: Colors.brown[300]),
              SizedBox(height: 40),

              // Sign-In text
              Text(
                'Sign-In',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20),

              // Username input
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFFFD8A9),
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Password input
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFFFD8A9),
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Sign-In button
              ElevatedButton(
                onPressed: () {
                  // Handle sign-in logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8B5E4A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                ),
                child: Text(
                  'Sign-In',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),

              // Sign-up option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to sign-up page
                    },
                    child: Text(
                      'Sign-up',
                      style: TextStyle(color: Color(0xFF8B5E4A)),
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
