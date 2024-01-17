import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const PageTitle({
    Key? key,
    required this.text,
    this.fontSize = 32,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Color(0xFF2B333E),
        ),
      ),
    );
  }
}
