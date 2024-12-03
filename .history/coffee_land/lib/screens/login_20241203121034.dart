import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _formsState();
}

class _formsState extends State<login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _message = "";

  Future<void> _login() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    final response = await http.post(
      Uri.parse('http://localhost:3000/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _message = "Login successful!";
      });
      Navigator.pushNamed(context, '/cappuccino');
    } else {
      setState(() {
        _message = "Invalid username or password";
      });
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
            onPressed: _login,
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
