import 'package:flutter/material.dart';
import 'package:covid/components/health/chat_bubble.dart';

class TypingMessage extends StatefulWidget {
  @override
  _TypingMessageState createState() => _TypingMessageState();
}

class _TypingMessageState extends State<TypingMessage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();

    _animation = IntTween(begin: 0, end: 2).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));

    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeListener(() {});
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ChatBubble(
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) {
              return Container(
                width: width * 0.03,
                height: width * 0.03,
                margin: EdgeInsets.only(
                  bottom: index == _animation.value ? 10.0 : 1.0,
                ),
                decoration: BoxDecoration(
                  color: index == _animation.value
                      ? const Color(0x99808080)
                      : const Color(0x55808080),
                  shape: BoxShape.circle,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
