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
        lotteryNumber = rand.nextInt(10);
        yourNumber = rand.nextInt(10);
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
          title: Center(
            child: Text("Lottery Prac"),
          ),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        floatingActionButton:
            FloatingActionButton(
              onPressed: gameOver
                  ? restart
                  : generateNumber,
              backgroundColor: gameOver
                  ? Colors.red
                  : Colors.green,
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
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.center,
              children: [
                Text(
                  "Lottery Number is : $lotteryNumber",
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 22,
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 130,
                    width: 300,
                    decoration: BoxDecoration(
                      color:
                          yourNumber ==
                              lotteryNumber
                          ? Colors.cyanAccent
                          : Colors.grey
                                .withOpacity(0.3),
                      borderRadius:
                          BorderRadius.circular(
                            15,
                          ),
                    ),
                    child: hasPlayed
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
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
                              Center(
                                child: Text(
                                  yourNumber ==
                                          lotteryNumber
                                      ? "You WON! Your Number was $yourNumber"
                                      : "You Lost!. Your Number was $yourNumber. Try Again!",
                                  textAlign:
                                      TextAlign
                                          .center,
                                ),
                              ),
                            ],
                          )
                        : const Center(
                            child: Text(
                              "🎲 Tap Generate to try your luck!",
                              textAlign: TextAlign
                                  .center,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 20),
                Text(
                  "Score : $score",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  gameOver
                      ? "Game Over! Tap to Restart"
                      : "Tries Left : ${maxTries - tries}",
                  style: TextStyle(
                    color: gameOver
                        ? Colors.red
                        : Colors.blueAccent,
                    fontSize: 14,
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
