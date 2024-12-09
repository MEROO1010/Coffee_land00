import 'dart:convert';
import 'package:coffee_land/screens/Home.dart';
import 'package:coffee_land/screens/login.dart';
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
        done: Done(child: Icon(Icons.done), home: HomeScreen()),
        next: Next(child: Icon(Icons.arrow_forward)),
        back: Back(child: Icon(Icons.arrow_back)),
        dotIndicator: DotIndicator(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Center(
        child: Text("Login to CoffeeLand", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
