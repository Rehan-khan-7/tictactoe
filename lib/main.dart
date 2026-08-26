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
                  ),
                  ),
                   GestureDetector(
                    onTap: () {
                      print("Square 2 tapped");
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
                      print("Square 3 tapped");
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
                      print("Square 4 tapped");
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
                      print("Square 5 tapped");
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
                      print("Square 6 tapped");
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
                      print("Square 7 tapped");
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
                      print("Square 8 tapped");
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
                      print("Square 9 tapped");
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