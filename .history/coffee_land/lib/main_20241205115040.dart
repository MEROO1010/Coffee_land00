import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  String title = "Loading...";
  String subtitle = "Please wait...";
  String logoImage = "";
  String backgroundImage = "";

  @override
  void initState() {
    super.initState();
    fetchSplashData();
  }

  Future<void> fetchSplashData() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/api/splash'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        title = data['title'];
        subtitle = data['subtitle'];
        logoImage = data['logo_image'];
        backgroundImage = data['background_image'];
      });
    } else {
      print("Failed to fetch splash screen data.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          backgroundImage.isNotEmpty
              ? Image.network(backgroundImage, fit: BoxFit.cover)
              : Container(color: Colors.white),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Image
                logoImage.isNotEmpty
                    ? Image.network(logoImage, width: 200, height: 200)
                    : Container(),
                const SizedBox(height: 20),
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                // Subtitle
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 30, color: Colors.brown),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
