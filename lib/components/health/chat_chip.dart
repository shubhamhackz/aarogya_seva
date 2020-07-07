import 'package:flutter/material.dart';
import 'package:covid/components/health/chat_bubble.dart';

class ChatChip extends StatefulWidget {
  final List<String> chatChips;
  final Function isCompletedCallBack;
  final Function problemscallback;

  ChatChip(
      {@required this.chatChips,
      this.isCompletedCallBack,
      this.problemscallback});

  @override
  _ChatChipState createState() => _ChatChipState();
}

class _ChatChipState extends State<ChatChip> {
  List<bool> _selectedValue;
  bool showNextButton = false;
  List<String> chips;
  bool showReply = false;
  List<String> replies = [];
  int problems = 0;

  @override
  void initState() {
    initializeChips();
    super.initState();
  }

  initializeChips() {
    chips = List.from(widget.chatChips, growable: true);
    buildNextButton();
    _selectedValue = List.generate(chips.length, (index) => false);
  }

  buildNextButton() {
    String next = 'Next';
    String noneOfThese = 'None of These';
    if (showNextButton) {
      if (chips.contains(noneOfThese)) {
        chips.remove(noneOfThese);
        chips.add(next);
      } else {
        if (!chips.contains(next)) {
          chips.add(next);
        }
      }
    } else {
      if (chips.contains(next)) {
        chips.remove(next);
        chips.add(noneOfThese);
      } else {
        if (!chips.contains(noneOfThese)) {
          chips.add(noneOfThese);
        }
      }
    }
  }

  updateNextButton() {
    if (_selectedValue.contains(true)) {
      showNextButton = true;
    } else {
      showNextButton = false;
    }
  }

  onTapped(value) {
    if (value != chips.length - 1) {
      updateNextButton();
      buildNextButton();
      setState(() {});
    } else {
      if (showNextButton) {
        problems++;
        widget.problemscallback(problems);
        showReply = true;
        for (int selected = 0;
            selected < _selectedValue.length - 1;
            selected++) {
          if (_selectedValue[selected]) {
            replies.add(chips[selected]);
          }
        }
        setState(() {});
      } else {
        showReply = true;
        for (int selected = 0; selected < _selectedValue.length; selected++) {
          if (_selectedValue[selected]) {
            replies.add(chips[selected]);
          }
        }
        setState(() {});
      }
    }
  }

  buildReply(List<String> replies) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.isCompletedCallBack();
    }); //calling isCompletedCallback after building the widget
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        replies.length,
        (index) {
          return Container(
            alignment: Alignment.centerRight,
            child: ChatBubble(
              child: Text(
                replies[index],
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'ProductSans',
                  color: const Color(0xFFFFFFFF),
                ),
              ),
              isReply: true,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return showReply ? buildReply(replies) : buildChips(width);
  }

  Widget buildChips(double width) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.07, vertical: width * 0.025),
      child: Wrap(
        children: List.generate(
          chips.length,
          (index) {
            return Container(
              padding: EdgeInsets.only(right: width * 0.02),
              child: ChoiceChip(
                selected: _selectedValue[index],
                onSelected: (value) {
                  _selectedValue[index] = value;
                  onTapped(index);
                },
                label: FittedBox(
                  child: Text(
                    chips[index],
                  ),
                ),
                labelStyle: TextStyle(
                  color: _selectedValue[index]
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF000000),
                  fontFamily: 'ProductSans',
                  fontSize: 18,
                ),
                labelPadding: EdgeInsets.symmetric(
                    horizontal: width * 0.035, vertical: width * 0.007),
                selectedColor: const Color(0xCC5785f3),
                backgroundColor: const Color(0xFFFFFFFF),
                // shape: RoundedRectangleBorder(
                //     side: BorderSide(), borderRadius: BorderRadius.circular(20)),
                shadowColor: Colors.black,
                pressElevation: 0,
                elevation: 15,
                selectedShadowColor: const Color(0xFFF8F8FF),
              ),
            );
          },
        ),
      ),
    );
  }
}
