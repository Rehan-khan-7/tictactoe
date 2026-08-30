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
  List<int> winningCells = [];
  List<String> board = ["", "", "", "", "", "", "", "", ""];
  String currentPlayer = "X";
  int xScore = 0;
  int oScore = 0;
  String winner = "";
  bool gameover = false;
  bool draw = false;
  bool xStarts = true;

  void resetGame() {
    setState(() {
      board = ["", "", "", "", "", "", "", "", ""];
      xStarts = !xStarts;
      currentPlayer = xStarts ? "X" : "O";
      winner = "";
      gameover = false;
      draw = false;
      winningCells = [];
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
        winningCells = pattern;
        gameover = true;

        if (winner == "X") {
          xScore++;
          xStarts = true;
        } else {
          oScore++;
          xStarts = false;
        }
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[100]),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tic Tac Toe",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "X: $xScore",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),

                      const SizedBox(width: 40),

                      Text(
                        "O: $oScore",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),
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
                  const SizedBox(height: 20),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      double boardSize = constraints.maxWidth * 0.9;

                      if (boardSize > 360) {
                        boardSize = 360;
                      }

                      return Center(
                        child: SizedBox(
                          width: boardSize,
                          height: boardSize,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                            itemCount: 9,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  makeMove(index);
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: winningCells.contains(index)
                                        ? Colors.green[100]
                                        : Colors.white,
                                    border: Border.all(
                                      color: winningCells.contains(index)
                                          ? Colors.green
                                          : Colors.black26,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      board[index],
                                      style: TextStyle(
                                        fontSize: boardSize * 0.15,
                                        fontWeight: FontWeight.bold,
                                        color: board[index] == "X"
                                            ? Colors.blue
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 25),
                  // Row
                  ElevatedButton(
                    onPressed: resetGame,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Reset Game",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Column
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
