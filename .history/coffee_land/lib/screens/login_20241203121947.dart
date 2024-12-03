import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _message = "";

  Future<void> login(String email, String password) async {
    const String apiUrl =
        'http://10.0.2.2:5000/login'; // Localhost for Android emulator

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('Login Successful: ${data['message']}');
      Navigator.pushNamed(context, '/cappuccino'); // Redirect
    } else {
      final error = json.decode(response.body);
      print('Login Failed: ${error['error']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 50, top: 344),
          child: Text(
            "Login",
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
          padding: EdgeInsets.only(top: 420, left: 30),
          child: SizedBox(
            width: 340,
            child: Material(
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Username or Email',
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
          padding: EdgeInsets.only(top: 520, left: 30),
          child: SizedBox(
            width: 340,
            child: Material(
              child: TextField(
                controller: _passwordController,
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
        Container(
          padding: EdgeInsets.only(top: 640, left: 30),
          child: TextButton(
            onPressed: () {
              final email =
                  'user@example.com'; // Replace with the input from TextField
              final password =
                  'password123'; // Replace with the input from TextField
              login(email, password);
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
              'Login',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(237, 229, 218, 1),
              ),
            ),
          ),
        ),
        if (_message.isNotEmpty)
          Container(
            padding: EdgeInsets.only(top: 700, left: 30),
            child: Text(
              _message,
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
      ],
    );
  }
}
