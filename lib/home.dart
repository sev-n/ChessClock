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
  //int secs = 60;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (t) {
      var p1 = Provider.of<PlayerOne>(context, listen: false);
      var p2 = Provider.of<PlayerTwo>(context, listen: false);
      p1.updateTime();
      p2.updateTime();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.grey,
              child: Consumer<PlayerOne>(
                builder: (context, p1, child) {
                  return Text(
                    p1.getTime().toString(),
                    style: const TextStyle(
                      fontSize: 60,
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: Colors.blueGrey,
                  child: Consumer<PlayerTwo>(
                builder: (context, p2, child) {
                  return Text(
                    p2.getTime().toString(),
                    style: const TextStyle(
                      fontSize: 60,
                    ),
                  );
                },
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
