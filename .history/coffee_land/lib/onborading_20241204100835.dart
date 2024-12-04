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
    return Column(
      children: [
        // Image Section
        Image.asset(
          imageAsset,
          width: 200, // Adjust the width as needed
          height: 200, // Adjust the height as needed
        ),

        // Title Section
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),

        // Description Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

// Usage in your main app:
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
                'assets/coffee_beans.png', // Replace with your image path
          ),
          OnboardingScreen(
            title: 'Diverse Coffee Selection',
            description:
                'Choose from a wide range of coffee blends and flavors.',
            imageAsset:
                'assets/coffee_cups.png', // Replace with your image path
          ),
          OnboardingScreen(
            title: 'Easy Ordering Process',
            description: 'Place your orders in just a few taps.',
            imageAsset:
                'assets/phone_order.png', // Replace with your image path
          ),
          OnboardingScreen(
            title: 'Fast Delivery',
            description: 'Get your coffee delivered right to your doorstep.',
            imageAsset:
                'assets/delivery_bike.png', // Replace with your image path
          ),
        ],
      ),
    );
  }
}
