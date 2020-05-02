import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'gender_icons.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  double height = 100.0;

  void activateMaleCard() {
    setState(() {
      gender = Gender.male;
    });
  }

  void activateFemaleCard() {
    setState(() {
      gender = Gender.female;
    });
  }

  Color maleCardColor() => gender == Gender.male
      ? ReusableCard.activeCardColor
      : ReusableCard.inactiveCardColor;
  Color femaleCardColor() => gender == Gender.female
      ? ReusableCard.activeCardColor
      : ReusableCard.inactiveCardColor;

  void updateHeight(double height) {
    setState(() {
      this.height = height;
    });
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTap: () => activateMaleCard(),
                    color: maleCardColor(),
                    child: GenderIcon.male,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () => activateFemaleCard(),
                    color: femaleCardColor(),
                    child: GenderIcon.female,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: heightCard(),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: Color(0xFFEB1555),
            height: 80.0,
            width: double.infinity,
          )
        ],
      ),
    );
  }

  ReusableCard heightCard() {
    return ReusableCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              '${format(height)} cm',
            ),
            Slider(
              value: height,
              max: 300.0,
              onChanged: updateHeight,
              divisions: 600,
            ),
            Text(
              'HEIGHT',
            ),
          ],
        ),
      ),
    );
  }
}
