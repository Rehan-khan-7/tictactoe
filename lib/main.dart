import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
List<String> board = [
  "","","",
  "","","",
  "","",""
];
String currentPlayer = "X";

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tic Tac Toe'),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        board[0]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        print(board[0]);
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                  ),
                  ),
                   GestureDetector(
                    onTap: () {
                     setState(() {
                        board[1]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        print(board[1]);
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                  ),
                  ),
                  
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        board[2]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        print(board[2]);
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                  ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        board[3]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        print(board[3]);
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                  ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        board[4]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        print(board[4]);
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                  ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        board[5]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        print(board[5]);
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                  ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        board[6]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        print(board[6]);
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                  ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        board[7]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        print(board[7]);
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                  ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        board[8]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        print(board[8]);
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                  ),
                  ),
                ],
              ),
            ],
          ),
),
      ),
    );
  }
}