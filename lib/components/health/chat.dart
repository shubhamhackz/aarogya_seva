import 'package:covid/animation/typing_message.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:covid/components/health/chat_bubble.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final String text;

  Chat({this.text});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool showTyping = true;
  TypingMessage _typingMessage;

  @override
  void initState() {
    _typingMessage = TypingMessage();
    Future.delayed(const Duration(seconds: 1), () {
      showTyping = false;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return showTyping
        ? DelayedDisplay(
            child: _typingMessage,
          )
        : ChatBubble(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'ProductSans',
              ),
            ),
          );
  }
}
