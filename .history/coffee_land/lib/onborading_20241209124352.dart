import 'package:coffee_land/screens/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_slider/source/presentation/pages/introduction_slider.dart';
import 'package:introduction_slider/source/presentation/widgets/background_decoration.dart';
import 'package:introduction_slider/source/presentation/widgets/buttons.dart';
import 'package:introduction_slider/source/presentation/widgets/dot_indicator.dart';
import 'package:introduction_slider/source/presentation/widgets/introduction_slider_item.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionSlider(
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
    );
  }
}
