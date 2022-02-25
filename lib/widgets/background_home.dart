import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundHome extends StatelessWidget {

  final boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.2, 0.8],
        colors: [
          Color(0xff498568),
          Color(0xff326185)
        ]
      )
  );

  const BackgroundHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Purple Gradinet
        Container(decoration: boxDecoration ),

        // Pink box
        Positioned(
          top: -100,
          left: -30,
          child: _PinkBox()
        ),
      ],
    );
  }
}


class _PinkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient:const LinearGradient(
            colors: [
              Color.fromRGBO(73, 133, 104, 1),
              Color.fromRGBO(50, 97, 133, 1),
            ]
          )
        ),
      ),
    );
  }
}