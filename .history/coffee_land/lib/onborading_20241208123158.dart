import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;

  const OnboardingScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAsset),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Text Overlay
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  description,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          OnboardingScreen(
            title: 'Welcome to Coffee Land',
            description:
                'Your one-stop solution for ordering your favorite coffees with ease.',
            imageAsset:
                'assets/images/onborading1.png', // Replace with your image path
          ),
          OnboardingScreen(
            title: 'Diverse Coffee Selection',
            description:
                'Choose from a wide range of coffee blends and flavors.',
            imageAsset:
                'assets/images/onborading2.png', // Replace with your image path
          ),
          OnboardingScreen(
            title: 'Easy Ordering Process',
            description: 'Place your orders in just a few taps.',
            imageAsset:
                'assets/images/onborading3.png', // Replace with your image path
          ),
          OnboardingScreen(
            title: 'Fast Delivery',
            description: 'Get your coffee delivered right to your doorstep.',
            imageAsset:
                'assets/images/onborading4.png', // Replace with your image path
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: OnboardingPage()),
  );
}
