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
  List<String> board = [
  "","","",
  "","","",
  "","",""
];
String currentPlayer = "X";

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
                        if (board[0].isEmpty){
                        board[0]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        }
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                    child: Center(
                    child: Text(
                    board[0],
                    style: const TextStyle(
                    fontSize: 40,
                    ),
                    ),
                   ),
                  ),
                  ),
                   GestureDetector(
                    onTap: () {
                     setState(() {
                        if (board[1].isEmpty){
                        board[1]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        }
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                    child: Center(
      child: Text(
        board[1],
        style: const TextStyle(
          fontSize: 40,
        ),
      ),
    ),
                  ),
                  ),
                  
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (board[2].isEmpty){
                        board[2]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        }
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                  
                  child: Center(
                  child: Text(
                   board[2],
                   style: const TextStyle(
                  fontSize: 40,
        ),
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
                      setState(() {
                        if (board[3].isEmpty){
                        board[3]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        }
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                    child: Center(
      child: Text(
        board[3],
        style: const TextStyle(
          fontSize: 40,
        ),
      ),
    ),
                  ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (board[4].isEmpty){
                        board[4]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        }
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                    child: Center(
      child: Text(
        board[4],
        style: const TextStyle(
          fontSize: 40,
        ),
      ),
    ),
                  ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (board[5].isEmpty){
                        board[5]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        }
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                    child: Center(
      child: Text(
        board[5],
        style: const TextStyle(
          fontSize: 40,
        ),
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
                      setState(() {
                        if (board[6].isEmpty){
                        board[6]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        }
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                    child: Center(
      child: Text(
        board[6],
        style: const TextStyle(
          fontSize: 40,
        ),
      ),
    ),
                  ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (board[7].isEmpty){
                        board[7]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        }
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                    child: Center(
      child: Text(
        board[7],
        style: const TextStyle(
          fontSize: 40,
        ),
      ),
    ),
                  ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (board[8].isEmpty){
                        board[8]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        }
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
                    child: Center(
      child: Text(
        board[8],
        style: const TextStyle(
          fontSize: 40,
        ),
      ),
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