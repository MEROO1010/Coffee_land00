import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:coffee_land/screens/login.dart';
import 'package:coffee_land/screens/signup.dart';

void main() {
  runApp(MyApp());
}

Future<void> fetchOnboardingContent() async {
  final response = await http.get(
    Uri.parse('http://<your-server>/api/onboarding-content'),
  );
  if (response.statusCode == 200) {
    final content = json.decode(response.body);
    print(content); // Use this to populate onboarding screens dynamically
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
        child: Stack(
          children: [
            Image.asset(
              'assets/images/splash screen.png', // Ensure the image is added to your assets folder
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingPage(
            imagePath: 'assets/images/onboarding1.png',
            fit: BoxFit.cover,
          ),
          OnboardingPage(
            imagePath: 'assets/images/onboarding2.png',
            fit: BoxFit.cover,
          ),
          OnboardingPage(
            imagePath: 'assets/images/onboarding3.png',
            fit: BoxFit.cover,
          ),
          OnboardingPage(
            imagePath: 'assets/images/onboarding4.png',
            fit: BoxFit.cover,
            isLastPage: true,
            onLastPageTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final bool isLastPage;
  final VoidCallback? onLastPageTap;

  const OnboardingPage({
    required this.imagePath,
    this.isLastPage = false,
    this.onLastPageTap,
    required BoxFit fit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 300),
        SizedBox(height: 20),
        if (isLastPage)
          ElevatedButton(onPressed: onLastPageTap, child: Text("Get Started")),
      ],
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to CoffeeLand!", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup Screen")),
      body: Center(
        child: Text(
          "Create your CoffeeLand account!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
