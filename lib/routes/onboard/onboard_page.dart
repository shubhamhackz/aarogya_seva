import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:covid/components/onboard/multi_colored_text.dart';

class OnboardPage extends StatefulWidget {
  OnboardPage({
    this.image,
    this.multiColoredText,
    this.infoText,
  });

  final Widget image;
  final String infoText;
  final MultiColoredText multiColoredText;

  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  bool viewportLarge = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double viewportHeight = MediaQuery.of(context).size.height;
    double viewportWidth = MediaQuery.of(context).size.width;
    viewportLarge = viewportHeight > 800.0;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: viewportLarge ? viewportHeight * 0.15 : viewportHeight * 0.1,
        horizontal: viewportWidth * 0.1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ScaleTransition(
            scale: _animation,
            child: widget.image,
          ),
          SizedBox(
            height: viewportHeight * 0.03,
          ),
          DelayedDisplay(
            fadingDuration: const Duration(seconds: 1),
            delay: const Duration(milliseconds: 100),
            slidingCurve: Curves.easeInSine,
            child: widget.multiColoredText,
          ),
          Visibility(
            child: viewportLarge
                ? SizedBox(
                    height: viewportHeight * 0.05,
                  )
                : SizedBox(
                    height: viewportHeight * 0.02,
                  ),
          ),
          DelayedDisplay(
            fadingDuration: const Duration(seconds: 1),
            slidingCurve: Curves.easeInSine,
            child: Text(
              widget.infoText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF707070), fontSize: viewportHeight * 0.022),
            ),
          ),
        ],
      ),
    );
  }
}
