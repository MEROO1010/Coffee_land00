import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class signup extends StatefulWidget {
  const signup(String name, String email, String password, {super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  Future<void> signup(String name, String email, String password) async {
    const String apiUrl = 'http://10.0.2.2:5000/signup';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      print('Sign-Up Successful');
    } else {
      final error = json.decode(response.body);
      print('Sign-Up Failed: ${error['error']}');
    }
  }

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
          Container(child: forms2()),
        ],
      ),
    );
  }
}

class forms2 extends StatefulWidget {
  const forms2({super.key});

  @override
  State<forms2> createState() => _forms2State();
}

class _forms2State extends State<forms2> {
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
        Padding(
          padding: EdgeInsets.only(top: 400, left: 30),
          child: SizedBox(
            width: 340,
            child: Material(
              child: TextField(
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
        Padding(
          padding: EdgeInsets.only(top: 480, left: 30),
          child: SizedBox(
            width: 340,
            child: Material(
              child: TextField(
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
        Padding(
          padding: EdgeInsets.only(top: 560, left: 30),
          child: SizedBox(
            width: 340,
            child: Material(
              child: TextField(
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

        /* Login Button */
        Container(
          padding: EdgeInsets.only(left: 30, top: 660),
          child: TextButton(
            onPressed: () {
              final name = 'John Doe'; // Replace with input
              final email = 'user@example.com'; // Replace with input
              final password = 'password123'; // Replace with input
              signup(name, email, password);
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
