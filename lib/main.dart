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
                        board[1]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
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
                        board[2]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
                        }
                        
                      });
                    },
                    child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    border: Border.all(),
                    ),
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
                        board[4]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
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
                        board[5]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
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
                        board[6]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
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
                        board[7]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
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
                        board[8]=currentPlayer;
                        if (currentPlayer == "X") {
                          currentPlayer = "O";
                        }else{
                          currentPlayer = "X";
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