import 'dart:async';

import 'package:chess_clock/player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var player1 = Provider.of<PlayerOne>(context, listen: false);
    var player2 = Provider.of<PlayerTwo>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Consumer<PlayerOne>(builder: (context, p1, child) {
                return ElevatedButton(
                  onPressed: p1.touch
                      ? () {
                          p1.disabledTouch();
                          if (player1.timeActive == true) {
                            player1.playerTimePause();
                          }
                          player2.enabledTouch();
                          player2.clockStart(player2);
                          debugPrint('$player2.timeActive');
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // button border radius
                    ),
                  ),
                  child: Text(
                    p1.getTime().toString(),
                    style: const TextStyle(
                      fontSize: 60,
                    ),
                  ),
                );
              }),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.black,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
                child: Consumer<PlayerTwo>(builder: (context, p2, child) {
                  return ElevatedButton(
                    onPressed: p2.touch
                        ? () {
                            p2.disabledTouch();
                            if (player2.timeActive == true) {
                              player2.playerTimePause();
                            }
                            player1.enabledTouch();
                            player1.clockStart(player1);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.grey,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // button border radius
                      ),
                    ),
                    child: Text(
                      p2.getTime().toString(),
                      style: const TextStyle(
                        fontSize: 60,
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
