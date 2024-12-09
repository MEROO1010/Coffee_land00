import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), navigateToNextScreen);
  }

  void navigateToNextScreen() async {
    var box = await Hive.openBox('onboarding');
    bool isOnboardingCompleted = box.get('status') == 'true';
    if (isOnboardingCompleted) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
