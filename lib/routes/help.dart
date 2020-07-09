import 'package:flutter/material.dart';
import 'package:covid/components/help/corona_test_request_card.dart';
import 'package:covid/components/help/prevention_card.dart';
import 'package:covid/components/help/symptoms_card.dart';
import 'package:covid/model/help/helpline_number.dart';
import 'package:covid/model/help/prevention.dart';
import 'package:covid/model/help/symptoms.dart';

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
