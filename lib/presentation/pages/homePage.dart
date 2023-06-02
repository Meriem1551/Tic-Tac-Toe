import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Color,
        Column,
        Container,
        EdgeInsets,
        ElevatedButton,
        Expanded,
        GestureDetector,
        GridView,
        MainAxisAlignment,
        Row,
        Scaffold,
        SizedBox,
        SliverGridDelegateWithFixedCrossAxisCount,
        StatefulWidget,
        Text,
        TextStyle,
        Widget;
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/basic.dart';

// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart'
    show BuildContext, State, StatefulWidget, Widget;

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool oTurn = true;
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  bool winnerExist = false;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  String winnerDeclaration = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 60,
                            child: Center(
                                child: Text(
                              ' Meriem: x',
                              style: TextStyle(fontSize: 30),
                            )),
                          ),
                          Text(
                            xScore.toString(),
                            style: const TextStyle(
                                fontSize: 50,
                                color: Color.fromARGB(255, 251, 163, 204)),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 60,
                            child: Center(
                                child: Text(
                              'Hafsa: o',
                              style: TextStyle(fontSize: 30),
                            )),
                          ),
                          Text(
                            oScore.toString(),
                            style: const TextStyle(
                                fontSize: 50,
                                color: Color.fromARGB(255, 251, 163, 204)),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 5,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          color: const Color.fromARGB(255, 244, 121, 162),
                        ),
                        child: Center(
                          child: Text(displayXO[index],
                              style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ),
                      ),
                    );
                  },
                )),
            Expanded(
              flex: 2,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    winnerDeclaration,
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 244, 121, 162)),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(132, 244, 85, 156),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16)),
                      onPressed: () {
                        _restartGame();
                      },
                      child: const Text(
                        'Start',
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'o';
        filledBoxes++;
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'x';
        filledBoxes++;
      }
      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        winnerDeclaration = 'player ${displayXO[0]} Wins!';
        _updatingScore(displayXO[0]);
      });
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        winnerDeclaration = 'player ${displayXO[3]} Wins!';
        _updatingScore(displayXO[3]);
      });
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        winnerDeclaration = 'player ${displayXO[6]} Wins!';
        _updatingScore(displayXO[6]);
      });
    }
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        winnerDeclaration = 'player ${displayXO[0]} Wins!';
        _updatingScore(displayXO[0]);
      });
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        winnerDeclaration = 'player ${displayXO[1]} Wins!';
        _updatingScore(displayXO[1]);
      });
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        winnerDeclaration = 'player ${displayXO[2]} Wins!';
        _updatingScore(displayXO[2]);
      });
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        winnerDeclaration = 'player ${displayXO[0]} Wins!';
        _updatingScore(displayXO[0]);
      });
    }
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      setState(() {
        winnerDeclaration = 'player ${displayXO[0]} Wins!';
        _updatingScore(displayXO[6]);
      });
    }
    if (!winnerExist && filledBoxes == 9) {
      setState(() {
        xScore++;
        oScore++;
        winnerDeclaration = 'There is no winner';
      });
    }
  }

  void _updatingScore(String winner) {
    if (winner == 'x') {
      xScore += 3;
    } else if (winner == 'o') {
      oScore += 3;
    }
    winnerExist = true;
  }

  void _restartGame() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      winnerDeclaration = '';
      filledBoxes = 0;
      xScore = 0;
      oScore = 0;
    });
  }
}
