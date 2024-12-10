import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          OnboardingPage(
            title: 'Welcome to Coffee Land',
            description: 'Discover the best coffee in town.',
            image: 'assets/images/onboarding1.png',
          ),
          OnboardingPage(
            title: 'Order Your Favorite Coffee',
            description: 'Choose from a variety of coffee options.',
            image: 'assets/images/onboarding2.png',
          ),
          OnboardingPage(
            title: 'Fast Delivery',
            description: 'Get your coffee delivered to your doorstep.',
            image: 'assets/images/onboarding3.png',
          ),
          OnboardingPage(
            title: 'Join Us Now',
            description: 'Sign up to start ordering.',
            image: 'assets/images/onboarding4.png',
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Text(description, textAlign: TextAlign.center),
      ],
    );
  }
}
