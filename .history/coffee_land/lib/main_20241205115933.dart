import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

Future<void> fetchOnboardingContent() async {
  final response = await http.get(
    Uri.parse('http://<your-server>/api/onboarding-content'),
  );
  if (response.statusCode == 200) {
    final content = json.decode(response.body);
    print(content); // Use this to populate onboarding screens
  } else {
    throw Exception('Failed to load onboarding content');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_screen.png', // Ensure the image is added to your assets folder
              height: 200, // Adjust the height
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Onboarding Screen")),
      body: Center(
        child: Text(
          "Welcome to CoffeeLand Onboarding!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
