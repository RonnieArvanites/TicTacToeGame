import 'package:flutter/material.dart';
import 'package:tictactoe/game_tile.dart';
import 'package:tictactoe/no_winner_dialog_box.dart';
import 'package:tictactoe/winner_dialog_box.dart';

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> gameState = new List.filled(9, '');
  bool isXTurn = true;

  bool _checkBoardFull() {
    if (gameState.contains('')) {
      return false;
    } else {
      return true;
    }
  }

  void _startNewGame() {
    setState(() {
      gameState = new List.filled(9, '');
      isXTurn = true;
    });
  }

  Future _checkForWinner() {
    var winningLines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (int i = 0; i < winningLines.length; i++) {
      int pos1 = winningLines[i][0];
      int pos2 = winningLines[i][1];
      int pos3 = winningLines[i][2];

      if (gameState[pos1] != '' &&
          gameState[pos1] == gameState[pos2] &&
          gameState[pos1] == gameState[pos3]) {
        String winner = isXTurn ? "O" : "X";
        return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => WinnerDialogBox(winner: winner, 
            startNewGame: (){
              _startNewGame();
            }));
      }
    }
    if (_checkBoardFull()) {
          return showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) => NoWinnerDialogBox(
                startNewGame: (){
              _startNewGame();
            }));
        }
  }

  Widget _newGameButton() {
    return FlatButton(
      color: Colors.black,
      onPressed: () {
        _startNewGame();
      },
      child: Text(
        "New Game",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget gameRow(value1, index1, value2, index2, value3, index3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 10),
          child: GameTile(
            value: value1,
            index: index1,
            onTap: () {
              setState(() {
                gameState[index1] = isXTurn ? "X" : "O";
                isXTurn = !isXTurn;
              });
              _checkForWinner();
            },
          ),
        ),
        Container(
          width: 3,
          height: 125,
          color: Colors.black,
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: GameTile(
            value: value2,
            index: index2,
            onTap: () {
              setState(() {
                gameState[index2] = isXTurn ? "X" : "O";
                isXTurn = !isXTurn;
              });
              _checkForWinner();
            },
          ),
        ),
        Container(
          width: 3,
          height: 125,
          color: Colors.black,
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: GameTile(
            value: value3,
            index: index3,
            onTap: () {
              setState(() {
                gameState[index3] = isXTurn ? "X" : "O";
                isXTurn = !isXTurn;
              });
              _checkForWinner();
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: Text(
            isXTurn ? "X's turn" : "O's turn",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        Container(height: 40),
        gameRow(gameState[0], 0, gameState[1], 1, gameState[2], 2),
        Container(
          width: 350,
          height: 3,
          color: Colors.black,
        ),
        gameRow(gameState[3], 3, gameState[4], 4, gameState[5], 5),
        Container(
          width: 350,
          height: 3,
          color: Colors.black,
        ),
        gameRow(gameState[6], 6, gameState[7], 7, gameState[8], 8),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(width: 150, height: 50, child: _newGameButton()),
        ),
      ],
    );
  }
}
