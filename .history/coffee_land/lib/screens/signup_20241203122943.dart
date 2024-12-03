import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class signup extends StatefulWidget {
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signup(String name, String email, String password) async {
    const String apiUrl = 'http://10.0.2.2:5000/signup';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
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
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "Password"),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                signup(name, email, password);
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
