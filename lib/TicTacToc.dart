import 'package:flutter/material.dart';

class TicTacToc extends StatefulWidget {
  const TicTacToc({super.key});

  @override
  State<TicTacToc> createState() => _TicTacTocState();
}

class _TicTacTocState extends State<TicTacToc> {
  List<String> displayOX = ['', '', '', '', '', '', '', '', ''];
  bool ohTurn = true;

  var myTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 40,
    fontFamily: "Lobster",
  );
  int Ohscore = 0;
  int exscore = 0;
  int FilledBoxed = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Player o ",
                          style: myTextStyle,
                        ),
                        Text(
                          Ohscore.toString(),
                          style: myTextStyle,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Player X ",
                          style: myTextStyle,
                        ),
                        Text(
                          exscore.toString(),
                          style: myTextStyle,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 127, 123, 123)),
                      ),
                      child: Center(
                        child: Text(
                          displayOX[index],
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                  child: Text(
                "Tic Tac Toe",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontFamily: "Lobster",
                ),
              )),
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Center(
                    child: Text(
                  "Ghada Ragab Ali",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontFamily: "Lobster",
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayOX[index] == '') {
        displayOX[index] = 'O';
        FilledBoxed += 1;
      } else if (!ohTurn && displayOX[index] == '') {
        displayOX[index] = 'X';
        FilledBoxed += 1;
      }
      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayOX[0] == displayOX[1] &&
        displayOX[0] == displayOX[2] &&
        displayOX[0] != '') {
      _showWinDialog(displayOX[0]);
    }
    if (displayOX[3] == displayOX[4] &&
        displayOX[3] == displayOX[5] &&
        displayOX[3] != '') {
      _showWinDialog(displayOX[3]);
    }
    if (displayOX[6] == displayOX[7] &&
        displayOX[6] == displayOX[8] &&
        displayOX[6] != '') {
      _showWinDialog(displayOX[6]);
    }
    if (displayOX[0] == displayOX[3] &&
        displayOX[0] == displayOX[6] &&
        displayOX[0] != '') {
      _showWinDialog(displayOX[0]);
    }
    if (displayOX[1] == displayOX[4] &&
        displayOX[1] == displayOX[7] &&
        displayOX[1] != '') {
      _showWinDialog(displayOX[1]);
    }
    if (displayOX[2] == displayOX[5] &&
        displayOX[2] == displayOX[8] &&
        displayOX[2] != '') {
      _showWinDialog(displayOX[2]);
    }
    if (displayOX[6] == displayOX[4] &&
        displayOX[6] == displayOX[2] &&
        displayOX[6] != '') {
      _showWinDialog(displayOX[6]);
    }
    if (displayOX[0] == displayOX[4] &&
        displayOX[0] == displayOX[8] &&
        displayOX[0] != '') {
      _showWinDialog(displayOX[0]);
    } else if (FilledBoxed == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Draw"),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 161, 155, 161),
                ),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text("Play Again!!"),
              )
            ],
          );
        });
  }

  void _showWinDialog(String Winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Winner is : " + Winner + " 🤞🥳"),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 161, 155, 161),
                ),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text("Play Again!!"),
              )
            ],
          );
        });

    if (Winner == 'O') {
      Ohscore += 1;
    } else if (Winner == 'X') {
      exscore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayOX[i] = '';
      }
    });
    FilledBoxed = 0;
  }
}
