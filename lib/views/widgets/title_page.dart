import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  final double size;
  const TitlePage({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return RichText(
      textAlign: TextAlign.center,
      text:  TextSpan(
          text: 'P',
          style: TextStyle(
              color:Colors.green,
              fontSize: size,
              fontWeight: FontWeight.w700),
          children: [
            TextSpan(
                text: 'layers',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: size,
                    fontWeight: FontWeight.w700)),
          ]),
    );
  }
}