import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

const iconSize = 80.0;

class GenderIcon extends StatelessWidget {
  final IconData icon;
  final String title;

  static const GenderIcon male =
      GenderIcon._(icon: Foundation.male_symbol, title: 'MALE');

  static const GenderIcon female =
      GenderIcon._(icon: Foundation.female_symbol, title: 'FEMALE');

  const GenderIcon._({@required this.icon, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        Text(
          title,
        ),
      ],
    );
  }
}
