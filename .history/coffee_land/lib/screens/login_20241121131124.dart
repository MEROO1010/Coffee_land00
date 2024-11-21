import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/accounts/login/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': usernameController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('Token: ${data['token']}');
      // Navigate to another page
    } else {
      print('Login failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: Color.fromRGBO(112, 122, 112, 1),
            fontFamily: 'Roboto-Regular.ttf',
            fontWeight: FontWeight.bold,
            fontSize: 28,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                focusColor: Colors.amberAccent,
                hintText: 'Username or Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromRGBO(237, 229, 218, 1),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Password',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromRGBO(237, 229, 218, 1),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => login(context),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
