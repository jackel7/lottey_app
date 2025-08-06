import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int yourNumber = 10;
  int lotteryNumber = 20;
  int tries = 0;
  final int maxTries = 5;
  int score = 0;
  bool gameOver = false;
  bool hasPlayed = false;
  Random rand = Random();

  void generateNumber() {
    if (tries < maxTries) {
      setState(() {
        lotteryNumber = rand.nextInt(5);
        yourNumber = rand.nextInt(5);
        tries++;
        hasPlayed = true;

        if (yourNumber == lotteryNumber) {
          score++;
        }
        if (tries == maxTries) {
          gameOver = true;
        }
      });
    }
  }

  void restart() {
    setState(() {
      yourNumber = 0;
      lotteryNumber = 0;
      gameOver = false;
      score = 0;
      tries = 0;
      hasPlayed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Lottery Game"),
          ),
          backgroundColor: const Color(
            0xFF0F3460,
          ), // Dark Blue
          foregroundColor: Colors.white,
        ),
        backgroundColor: const Color(
          0xFFF5F6FA,
        ), // Soft light grey
        floatingActionButton:
            FloatingActionButton(
              onPressed: gameOver
                  ? restart
                  : generateNumber,
              backgroundColor: gameOver
                  ? Colors.redAccent
                  : Colors.teal,
              tooltip: gameOver
                  ? "Restart Game"
                  : "Generate Number",
              child: Icon(
                gameOver
                    ? Icons.restart_alt_outlined
                    : Icons.casino_outlined,
                size: 24,
                color: Colors.white,
              ),
            ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation
                .centerFloat,

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.center,
              children: [
                Text(
                  "Lottery Number: $lotteryNumber",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    height: 150,
                    width: 320,
                    decoration: BoxDecoration(
                      color:
                          yourNumber ==
                              lotteryNumber
                          ? Colors
                                .lightGreen
                                .shade100
                          : Colors
                                .deepOrange
                                .shade100,
                      borderRadius:
                          BorderRadius.circular(
                            16,
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: hasPlayed
                        ? Column(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                            children: [
                              Icon(
                                yourNumber ==
                                        lotteryNumber
                                    ? Icons
                                          .check_circle
                                    : Icons.error,
                                color:
                                    yourNumber ==
                                        lotteryNumber
                                    ? Colors.green
                                    : Colors.red,
                                size: 30,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                yourNumber ==
                                        lotteryNumber
                                    ? "You WON! Your Number was $yourNumber"
                                    : "You Lost. Your Number was $yourNumber. Try Again!",
                                textAlign:
                                    TextAlign
                                        .center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                      FontWeight
                                          .w500,
                                ),
                              ),
                            ],
                          )
                        : const Center(
                            child: Text(
                              "Tap Generate to try your luck!",
                              textAlign: TextAlign
                                  .center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors
                                    .black54,
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Score: $score",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  gameOver
                      ? "Game Over! Tap to Restart"
                      : "Tries Left: ${maxTries - tries}",
                  style: TextStyle(
                    color: gameOver
                        ? Colors.redAccent
                        : Colors.blueAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
