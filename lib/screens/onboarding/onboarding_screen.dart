import 'package:flutter/material.dart';
import 'package:h_food/models/onboarding_model.dart';
import 'package:h_food/screens/authentication/signin_screen.dart';
import 'package:h_food/screens/onboarding/widgets/onboarding_slide.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:h_food/widgets/indicator/slide_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _slideIndex = 0;

  final List<OnboardingModel> _onboardingData = [
    OnboardingModel(
      id: 0,
      title: "Online Order",
      description:
          "Browse menu, customize your meal, and place your order - all with just a few taps.",
      image: "assets/images/misc/onboarding_1.jpg",
    ),
    OnboardingModel(
      id: 1,
      title: "Fast Delivery",
      description:
          "Track your order live and get your meal delivered hot and fresh in no time.",
      image: "assets/images/misc/onboarding_2.jpg",
    ),
    OnboardingModel(
      id: 2,
      title: "The wait is over",
      description: "Order what you love and enjoy bite - anytime, anywhere.",
      image: "assets/images/misc/onboarding_3.jpg",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = _slideIndex == 2;

    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: _onboardingData.length,
          onPageChanged: (pageIndex) {
            setState(() {
              _slideIndex = pageIndex;
            });
          },
          itemBuilder: (context, index) {
            final data = _onboardingData[index];
            return OnboardingSlide(
              id: data.id,
              title: data.title,
              description: data.description,
              image: data.image,
            );
          },
        ),
        // les points indicateurs dimages
        if (_slideIndex < _onboardingData.length)
          Positioned(
            bottom: 240,
            width: KscreenWidth(context),
            child: SlideIndicator(
              currentIndex: _slideIndex,
              itemCount: _onboardingData.length,
            ),
          ),

        Positioned(
          bottom: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
            child: DefaultButton(
              onPressed: () {
                isLastPage
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SigninScreen()),
                      )
                    : _pageController.animateToPage(
                        _slideIndex + 1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
              },
              label: (isLastPage) ? "Get Started" : "Next",
              width: KscreenWidth(context) - 40,
              height: 48,
              backgroundColor: Color(0xfff45a08),
              foregroundColor: Color(0xffffffff),
            ),
          ),
        ),
      ],
    );
  }
}
