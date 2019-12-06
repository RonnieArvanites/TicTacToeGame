import 'package:flutter/material.dart';

class NoWinnerDialogBox extends StatelessWidget {
  final VoidCallback startNewGame;

  NoWinnerDialogBox({this.startNewGame});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      contentPadding: EdgeInsets.all(10),
      backgroundColor: Colors.black,
      children: <Widget>[
        Center(
          child: Column(
            children: <Widget>[
              Text(
                "Game Over",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    startNewGame();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "New Game",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
