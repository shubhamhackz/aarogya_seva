import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  List<Symptoms> symptoms = [
    Symptoms(image: Image.asset('assets/images/cough.png'), text: 'Cough'),
    Symptoms(image: Image.asset('assets/images/fever.png'), text: 'High Fever'),
    Symptoms(
        image: Image.asset('assets/images/sore_throath.png'),
        text: 'Sore Throath'),
  ];

  List<Prevention> preventions = [
    Prevention(
        imageSource: 'assets/images/wash_hands.png',
        text: 'Wash Your Hands Often'),
    Prevention(
        imageSource: 'assets/images/wear_a_mask.png', text: 'Wear A Face Mask'),
    Prevention(
        imageSource: 'assets/images/always_cover_cough_sneeze.png',
        text: 'Always Cover Your Cough or Sneeze'),
    Prevention(
        imageSource: 'assets/images/avoid_handshakes.png',
        text: 'Avoid Contact With Sick People'),
  ];

  List<HelplilneNumber> helplineNumbers = [
    HelplilneNumber(region: 'India', number: '+91-11-23978046'),
    HelplilneNumber(region: 'Andhra Pradesh', number: '+91-866-2410978'),
    HelplilneNumber(region: 'Arunachal Predesh', number: '+91-9436055743'),
    HelplilneNumber(region: 'Assam', number: '+91-6913347770'),
    HelplilneNumber(region: 'Bihar', number: '104'),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CoronaTestRequestCard(),
              buildTitle(title: 'Symptoms', width: width),
              SizedBox(
                height: width * 0.54,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: width * 0.05),
                  itemBuilder: (context, index) {
                    return LayoutBuilder(builder: (context, constraints) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: width * 0.4, maxHeight: width * 0.4),
                        child: SymptomsCard(
                          image: symptoms[index].image,
                          text: symptoms[index].text,
                        ),
                      );
                    });
                  },
                  itemCount: symptoms.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              buildTitle(
                title: 'Preventions',
                width: width,
              ),
              Container(
                height: width * 0.52,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: width * 0.05),
                  itemBuilder: (context, index) {
                    return PreventionCard(
                      imageSource: preventions[index].imageSource,
                      text: preventions[index].text,
                    );
                  },
                  itemCount: preventions.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              buildTitle(
                title: 'Helpline Numbers',
                width: width,
              ),
              Column(
                children: List.generate(
                  helplineNumbers.length,
                  (index) => buildHelplineNumber(
                    region: helplineNumbers[index].region,
                    number: helplineNumbers[index].number,
                    width: width,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildHelplineNumber({String number, String region, double width}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: TextStyle(
              fontFamily: 'ProductSans',
              fontSize: 19,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(width: width * 0.06),
          Text(
            '($region)',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'ProductSans',
              color: const Color(0xFF7777FF),
            ),
          )
        ],
      ),
    );
  }

  Padding buildTitle({String title, double width}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: width * 0.04, horizontal: width * 0.05),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontFamily: 'ProductSans',
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class HelplilneNumber {
  String region;
  String number;

  HelplilneNumber({this.number, this.region});
}

class CoronaTestRequestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(width * 0.05),
      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
      width: width * 0.9,
      height: width * 0.35,
      color: const Color(0xFFFFFFFF),
      child: Row(
        children: <Widget>[
          Container(
            height: width * 0.18,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: const Color(0xFF7777FF),
            ),
            child: Image.asset(
              'assets/images/corona_small.png',
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Coronavirus Test Request',
                      style: TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: const Color(0xFF7777FF),
                      size: width * 0.08,
                    )
                  ],
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color(0xFFC5C5C5),
                      fontFamily: 'ProductSans'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Prevention {
  String imageSource;
  String text;

  Prevention({this.imageSource, this.text});
}

class PreventionCard extends StatelessWidget {
  const PreventionCard({this.imageSource, this.text});

  final String imageSource;
  final String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(
          height: width * 0.04,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.03,
          ),
          width: width * 0.24,
          height: width * 0.24,
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: const Color(0xFFFFFFFF),
            shadows: [
              BoxShadow(
                color: const Color(0x22000000),
                blurRadius: 15,
                spreadRadius: 5,
                // offset: Offset(5, 5),
              ),
            ],
          ),
          child: FittedBox(
            child: Image.asset(imageSource),
          ),
        ),
        Flexible(
          child: Container(
            width: width * 0.3,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              text,
              style:
                  TextStyle(fontSize: width * 0.042, fontFamily: 'ProductSans'),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class Symptoms {
  Image image;
  String text;

  Symptoms({this.image, this.text});
}

class SymptomsCard extends StatelessWidget {
  const SymptomsCard({
    this.image,
    this.text,
  });

  final Image image;
  final String text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Positioned(
          left: width * 0.05,
          top: height * 0.05,
          child: Container(
            height: height * 0.16,
            width: width * 0.35,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: const Color(0xFF7777FF),
              shadows: [
                BoxShadow(
                  color: const Color(0x33000000),
                  offset: Offset(5, 10),
                  blurRadius: 20,
                  spreadRadius: 7,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: width * 0.1,
          child: Column(
            children: <Widget>[
              SizedBox(
                child: image,
                height: height * 0.16,
              ),
              Text(
                text,
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontFamily: 'ProductSans',
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
