import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: [
          Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/signup-page.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(child: Forms2()), // Render the form
        ],
      ),
    );
  }
}

class Forms2 extends StatefulWidget {
  const Forms2({super.key});

  @override
  State<Forms2> createState() => _Forms2State();
}

class _Forms2State extends State<Forms2> {
  // Controllers for TextFields to capture user input
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signup(String name, String email, String password) async {
    const String apiUrl = 'http://10.0.2.2:5000/signup'; // Use local backend

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      // Successful sign-up
      print('Sign-Up Successful');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Sign-Up Successful!')));
    } else {
      final error = json.decode(response.body);
      print('Sign-Up Failed: ${error['error']}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-Up Failed: ${error['error']}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 50, top: 322),
          child: Text(
            "Sign-Up",
            style: TextStyle(
              color: Color.fromRGBO(112, 122, 112, 1),
              fontFamily: 'Roboto-Regular.ttf',
              fontWeight: FontWeight.bold,
              fontSize: 28,
              decoration: TextDecoration.none,
            ),
          ),
        ),

        // Name Input
        Padding(
          padding: EdgeInsets.only(top: 400, left: 30),
          child: SizedBox(
            width: 340,
            child: Material(
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  focusColor: Colors.amberAccent,
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromRGBO(237, 229, 218, 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Email Input
        Padding(
          padding: EdgeInsets.only(top: 480, left: 30),
          child: SizedBox(
            width: 340,
            child: Material(
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  focusColor: Colors.amberAccent,
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromRGBO(237, 229, 218, 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Password Input
        Padding(
          padding: EdgeInsets.only(top: 560, left: 30),
          child: SizedBox(
            width: 340,
            child: Material(
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromRGBO(237, 229, 218, 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Sign-Up Button
        Container(
          padding: EdgeInsets.only(left: 30, top: 660),
          child: TextButton(
            onPressed: () {
              final name = nameController.text.trim();
              final email = emailController.text.trim();
              final password = passwordController.text.trim();

              // Validate input before making API call
              if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
                signup(name, email, password);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('All fields are required!')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(191, 83, 44, 1),
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              minimumSize: Size(340, 50),
            ),
            child: Text(
              'Sign-Up',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(237, 229, 218, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
