import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var leftDiceNum = 1;
  var rightDiceNum = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Dicee"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftDiceNum = Random().nextInt(6)+1;
                    });
                  },
                  style:
                      TextButton.styleFrom(padding: const EdgeInsets.all(20.0)),
                  child: Image.asset("images/dice$leftDiceNum.png"),
                )),
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    leftDiceNum = Random().nextInt(6)+1;
                    rightDiceNum = Random().nextInt(6)+1;
                  });
                },
                style:
                    TextButton.styleFrom(padding: const EdgeInsets.all(20.0)),
                child: Image.asset("images/dice$rightDiceNum.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
