import 'package:coffee_land/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignInScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn(BuildContext context, String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/api/login'), // Adjust API endpoint
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login successful!')));
        // Navigate to another screen (e.g., Dashboard)
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Login failed!';
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error)));
      }
    } catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to connect to server!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EDE0), // Background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Coffee Bean Logo
              Image.asset(
                'assets/images/coffee_beans.png', // Replace with the coffee bean icon asset
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
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    'assets/images/user_icon.png',
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
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    'assets/images/password_icon.png',
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
                  final String username = usernameController.text.trim();
                  final String password = passwordController.text.trim();

                  if (username.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('All fields are required!')),
                    );
                  } else {
                    signIn(context, username, password);
                  }
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
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
