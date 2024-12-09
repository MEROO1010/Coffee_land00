import 'dart:convert';
import 'package:coffee_land/screens/login.dart';
import 'package:coffee_land/screens/signup.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:introduction_slider/source/presentation/pages/introduction_slider.dart';
import 'package:introduction_slider/source/presentation/widgets/background_decoration.dart';
import 'package:introduction_slider/source/presentation/widgets/buttons.dart';
import 'package:introduction_slider/source/presentation/widgets/dot_indicator.dart';
import 'package:introduction_slider/source/presentation/widgets/introduction_slider_item.dart';

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

              fit: BoxFit.cover, // Adjust the height
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
      body: IntroductionSlider(
        items: [
          IntroductionSliderItem(
            backgroundImageDecoration: BackgroundImageDecoration(
              image: AssetImage('assets/images/onboarding1.png'),
            ),
          ),
          IntroductionSliderItem(
            backgroundImageDecoration: BackgroundImageDecoration(
              image: AssetImage('assets/images/onboarding2.png'),
            ),
          ),
          IntroductionSliderItem(
            backgroundImageDecoration: BackgroundImageDecoration(
              image: AssetImage('assets/images/onboarding3.png'),
            ),
          ),
          IntroductionSliderItem(
            backgroundImageDecoration: BackgroundImageDecoration(
              image: AssetImage('assets/images/onboarding4.png'),
            ),
          ),
        ],
        done: Done(
          child: Icon(Icons.done, color: Colors.white),
          home: LoginScreen(),
        ),
        next: Next(child: Icon(Icons.arrow_forward, color: Colors.white)),
        back: Back(child: Icon(Icons.arrow_back, color: Colors.white)),
        dotIndicator: DotIndicator(
          selectedColor: Color.fromARGB(255, 255, 255, 255),
        ),
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

        SizedBox(height: 10),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0)),
        SizedBox(height: 30),
        if (isLastPage)
          ElevatedButton(onPressed: onLastPageTap, child: Text("Get Started")),
      ],
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn(BuildContext context, String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/api/login'),
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
