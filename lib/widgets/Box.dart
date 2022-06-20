import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final Color colour;

  Box({Key? key, required this.colour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: colour,
        border: Border.all(),
      ),
    );
  }
}
