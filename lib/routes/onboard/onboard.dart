import 'package:covid/components/action_button.dart';
import 'package:covid/constants/routes.dart';
import 'package:covid/routes/onboard/onboard_images.dart';
import 'package:covid/routes/onboard/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:covid/components/onboard/multi_colored_text.dart';
import 'package:covid/model/onboard/colored_text.dart';

class Onboard extends StatefulWidget {
  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  bool _onBoardingCompleted = false;

  updateControl(page) {
    print('Current Page: $page');
    if (page.toInt() == 3) {
      setState(() {
        _onBoardingCompleted = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: updateControl,
            children: <Widget>[
              SizedBox(
                child: OnboardPage(
                  image: SvgPicture(OnboardImage.svgImages['onboardOne']),
                  multiColoredText: const MultiColoredText(textItems: [
                    const ColoredText(text: 'Avoid '),
                    const ColoredText(text: 'Close ', colored: true),
                    const ColoredText(text: 'Contact'),
                  ]),
                  infoText:
                      'Keep your distance from others \n to protect them from getting sick too.',
                ),
              ),
              OnboardPage(
                image: SvgPicture(OnboardImage.svgImages['onboardTwo']),
                multiColoredText: const MultiColoredText(textItems: [
                  const ColoredText(text: 'Clean '),
                  const ColoredText(text: 'Your '),
                  const ColoredText(text: 'Hands ', colored: true),
                  const ColoredText(text: 'Often'),
                ]),
                infoText:
                    'Wash your hands with soap and water\, scrub your hands for at least 20 seconds.',
              ),
              OnboardPage(
                image: SvgPicture(OnboardImage.svgImages['onboardThree']),
                multiColoredText: const MultiColoredText(textItems: [
                  const ColoredText(text: 'Wear a '),
                  const ColoredText(text: 'facemask ', colored: true),
                  const ColoredText(text: 'if you are'),
                  const ColoredText(text: 'sick', colored: true),
                ]),
                infoText:
                    'Consider wearing a face mask when you are sick with a cough or sneezing',
              ),
              OnboardPage(
                image: SvgPicture(OnboardImage.svgImages['onboardFour']),
                multiColoredText: const MultiColoredText(textItems: [
                  const ColoredText(text: 'Stay '),
                  const ColoredText(text: 'at '),
                  const ColoredText(text: 'Home', colored: true),
                ]),
                infoText:
                    'Staying at home will help control the spread of the virus to friends\, the wider community.',
              ),
            ],
          ),
          Positioned(
            bottom: height * 0.06,
            width: width,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _onBoardingCompleted
                      ? onBoardingCompleted(width, height)
                      : onBoardingControl(),
                )),
          ),
        ],
      ),
    );
  }

  Align onBoardingCompleted(width, height) {
    return Align(
      alignment: Alignment.center,
      child: ActionButton(
        buttonCallback: naviagateToHome,
        text: 'Let\'s Go',
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.2, vertical: height * 0.02),
      ),
    );
  }

  Row onBoardingControl() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: naviagateToHome,
          child: Text('Skip',
              style: TextStyle(color: Colors.grey[600], fontSize: 18)),
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: 4,
          effect: ScrollingDotsEffect(
              dotWidth: 12.0,
              dotHeight: 12.0,
              activeDotColor: const Color(0xFF7777FF),
              dotColor: Colors.grey[300],
              paintStyle: PaintingStyle.stroke,
              strokeWidth: 2.2),
        ),
        ActionButton(
          text: 'Next',
          padding: EdgeInsets.zero,
          buttonCallback: () {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear);
          },
        ),
      ],
    );
  }

  void naviagateToHome() {
    //navigate to home
    Navigator.popAndPushNamed(context, Routes.kHomepage);
  }
}
