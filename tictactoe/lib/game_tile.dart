import 'package:flutter/material.dart';

class GameTile extends StatelessWidget {
  final value;
  final index;
  final VoidCallback onTap;


  GameTile({this.value ,this.index, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (value != '') {
      return Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        color: Colors.transparent,
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        color: Colors.transparent
      )
      );
    }
  }
}
