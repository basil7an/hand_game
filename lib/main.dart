import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Game());
}

class Game extends StatefulWidget {
  @override
  State<Game> createState() => _GameState();
}

double TBscale1 = 1;
double TBscale2 = 1;
double TBscale3 = 1;
int a = 0;
int your_resualt = 0;
int sys_resualt = 0;

class _GameState extends State<Game> {
  int inc1 = 0;
  int inc2 = 0;

  void choeses(int hand) {
    setState(() {
      inc1 = hand;
      inc2 = Random().nextInt(3);
    });
  }

  void winner() {
    if (inc1 == 0 && inc2 == 1 ||
        inc1 == 1 && inc2 == 2 ||
        inc1 == 2 && inc2 == 0) {
      your_resualt++;
    } else if (inc2 == 0 && inc1 == 1 ||
        inc2 == 1 && inc1 == 2 ||
        inc2 == 2 && inc1 == 0) {
      sys_resualt++;
    } else if (inc1 == inc2) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Center(
            child: Text(
              'ROCK PAPER SCISSORS',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "YOU : $your_resualt SYSTEM : $sys_resualt",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image(
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                        image: AssetImage('images/hand$inc1.png'),
                      ),
                      const Text(
                        'YOU',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const Text(
                  'VS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image(
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                        image: AssetImage('images/hand$inc2.png'),
                      ),
                      const Text(
                        'SYSTEM',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedScale(
                  duration: Duration(milliseconds: 250),
                  scale: TBscale1,
                  child: TextButton(
                    onPressed: () {
                      TBscale1 = 1.5;
                      choeses(0);
                      setState(() {
                        Timer(Duration(milliseconds: 250), () {
                          setState(() {
                            TBscale1 = 1;
                          });
                        });
                        winner();
                      });
                    },
                    child: Image.asset(
                      'images/hand0.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedScale(
                      duration: Duration(milliseconds: 250),
                      scale: TBscale2,
                      child: TextButton(
                        onPressed: () {
                          TBscale2 = 1.5;
                          choeses(1);
                          setState(() {
                            winner();
                            Timer(Duration(milliseconds: 250), () {
                              setState(() {
                                TBscale2 = 1;
                              });
                            });
                          });
                        },
                        child: Image.asset(
                          'images/hand1.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    AnimatedScale(
                      duration: Duration(milliseconds: 250),
                      scale: TBscale3,
                      child: TextButton(
                        onPressed: () {
                          TBscale3 = 1.5;
                          choeses(2);
                          setState(() {
                            winner();
                            Timer(Duration(milliseconds: 250), () {
                              setState(() {
                                TBscale3 = 1;
                              });
                            });
                          });
                        },
                        child: Image.asset(
                          'images/hand2.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: Container(
                width: 50,
                height: 50,
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        your_resualt = 0;
                        sys_resualt = 0;
                      });
                    },
                    child: const Icon(
                      Icons.replay_outlined,
                      size: 50,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
