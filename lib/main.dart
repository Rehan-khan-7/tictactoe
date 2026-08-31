import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  List<int> winningCells = [];
  List<String> board = ["", "", "", "", "", "", "", "", ""];
  String currentPlayer = "X";
  int xScore = 0;
  int oScore = 0;
  String winner = "";
  bool gameover = false;
  bool draw = false;
  bool xStarts = true;
  late AnimationController _winAnimationController;
  late Animation<double> _cutAnimation;

  @override
  void initState() {
    super.initState();
    _winAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _cutAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _winAnimationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _winAnimationController.dispose();
    super.dispose();
  }

  void resetGame() {
    _winAnimationController.reset();
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

  void newGame() {
    _winAnimationController.reset();
    setState(() {
      board = ["", "", "", "", "", "", "", "", ""];
      currentPlayer = "X";
      xScore = 0;
      oScore = 0;
      xStarts = true;
      winner = "";
      gameover = false;
      draw = false;
      winningCells=[];
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
        _winAnimationController.forward();

        if (winner == "X") {
          xScore++;
          xStarts = false;
        } else {
          oScore++;
          xStarts = true;
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
          )
        ),

        body: gameover ? _buildGameOverScreen() : _buildGameScreen(),
      ),
    );
  }

  Widget _buildGameScreen() {
    return SafeArea(
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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                child: Text(
                  "Player $currentPlayer's Turn",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
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
                          bool isWinningCell = winningCells.contains(index);
                          return AnimatedBuilder(
                            animation: _cutAnimation,
                            builder: (context, child) {
                              double animationValue = _cutAnimation.value;
                              
                              return GestureDetector(
                                onTap: () {
                                  makeMove(index);
                                },
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateZ(isWinningCell ? animationValue * 0.3 : 0)
                                    ..scale(isWinningCell ? 1 - (animationValue * 0.05) : 1.0),
                                  child: Container(
                                    margin: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: isWinningCell
                                          ? Color.lerp(
                                              Colors.green[100],
                                              Colors.yellow[300],
                                              (animationValue * 2 - 1).clamp(0, 1),
                                            )
                                          : Colors.white,
                                      border: Border.all(
                                        color: isWinningCell
                                            ? Color.lerp(
                                                Colors.green,
                                                Colors.amber,
                                                animationValue.clamp(0, 1),
                                              ) ?? Colors.green
                                            : Colors.black26,
                                        width: isWinningCell ? 2 + (animationValue * 2) : 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: isWinningCell
                                              ? Colors.amber.withOpacity(animationValue * 0.8)
                                              : Colors.black12,
                                          blurRadius: isWinningCell ? 5 + (animationValue * 10) : 5,
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
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGameOverScreen() {
    return SafeArea(
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

            const SizedBox(height: 40),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: winner.isNotEmpty
                    ? Colors.green[50]
                    : Colors.orange[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: winner.isNotEmpty
                      ? Colors.green
                      : Colors.orange,
                  width: 2,
                ),
              ),
              child: Text(
                winner.isNotEmpty
                    ? "$winner Wins! 🎉"
                    : "It's a Draw! 🤝",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: winner.isNotEmpty
                      ? Colors.green[700]
                      : Colors.orange[700],
                ),
              ),
            ),

            const SizedBox(height: 60),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: resetGame,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Reset Game",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                ElevatedButton(
                  onPressed: newGame,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "New Game",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
