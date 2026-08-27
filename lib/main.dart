import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> board = ["", "", "", "", "", "", "", "", ""];
  String currentPlayer = "X";
  String winner = "";
  bool gameover = false;
  bool draw = false;
  void resetGame() {
    setState(() {
      board = ["", "", "", "", "", "", "", "",""];
      currentPlayer = "X";
      winner = "";
      gameover = false;
      draw = false;
    });
  }

  void checkWinner() {
    List<List<int>> winningPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winningPatterns) {
      if (board[pattern[0]].isNotEmpty &&
          board[pattern[0]] == board[pattern[1]] &&
          board[pattern[1]] == board[pattern[2]]) {
        winner = board[pattern[0]];
        gameover = true;
      }
    }
  }

  void makeMove(int index) {
    if (gameover) {
      return;
    }

    if (board[index].isEmpty) {
      setState(() {
        board[index] = currentPlayer;

        checkWinner();

        if (!gameover && !board.contains("")) {
          draw = true;
          gameover = true;
        }

        if (!gameover) {
          if (currentPlayer == "X") {
            currentPlayer = "O";
          } else {
            currentPlayer = "X";
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Tic Tac Toe')),
        body: Center(
          child: Column(
            children: [
              Text(
                winner.isNotEmpty
                    ? "$winner wins!"
                    : draw
                    ? "Draw!"
                    : "Player $currentPlayer's turn",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      makeMove(0);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(
                        child: Text(
                          board[0],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      makeMove(1);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(
                        child: Text(
                          board[1],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      makeMove(2);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(border: Border.all()),

                      child: Center(
                        child: Text(
                          board[2],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      makeMove(3);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(
                        child: Text(
                          board[3],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      makeMove(4);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(
                        child: Text(
                          board[4],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      makeMove(5);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(
                        child: Text(
                          board[5],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      makeMove(6);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(
                        child: Text(
                          board[6],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      makeMove(7);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(
                        child: Text(
                          board[7],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      makeMove(8);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(
                        child: Text(
                          board[8],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Row
              ElevatedButton(onPressed: resetGame, child: Text("Reset Game")),

              // Column
            ],
          ),
        ),
      ),
    );
  }
}
