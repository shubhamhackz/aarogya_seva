import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key key,
    @required this.child,
    this.isReply = false,
  }) : super(key: key);

  final Widget child;
  final bool isReply;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.07, vertical: width * 0.025),
      padding: EdgeInsets.all(12),
      decoration: ShapeDecoration(
        //color: isReply ? const Color(0xDD5785f3) : const Color(0xFFFFFFFF),
        gradient: isReply
            ? LinearGradient(
                colors: [const Color(0xFF0771f6), const Color(0xFF0762d5)])
            : LinearGradient(
                colors: [const Color(0xFFFFFFFF), const Color(0xCCFFFFFF)]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: isReply ? Radius.circular(0) : Radius.circular(20),
            bottomLeft: isReply ? Radius.circular(20) : Radius.circular(0),
          ),
        ),
        shadows: <BoxShadow>[
          BoxShadow(
            color: const Color(0xBB808080),
            blurRadius: 15,
            offset: Offset(8.0, 5.0),
          ),
        ],
      ),
      child: child,
    );
  }
}
