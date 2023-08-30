import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var leftDiceNum = 1;
  var rightDiceNum = 1;
  bool isShake = false;
  late ShakeDetector detector;
  Axis direction = Axis.vertical; // Default layout direction

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.waitForStart(
      onPhoneShake: () {
        setState(() {
          rollDice();
        });
      },
      shakeThresholdGravity: 1.5,
    );
  }

  void rollDice() {
    leftDiceNum = Random().nextInt(6) + 1;
    rightDiceNum = Random().nextInt(6) + 1;
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Dicee"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text("Shake : "),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isShake = !isShake;
                      if (isShake) {
                        detector.startListening();
                      } else {
                        detector.stopListening();
                      }
                    });
                  },
                  icon: Icon(
                    isShake ? Icons.vibration_rounded : Icons.phone_android,
                    size: 25.0,
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.red,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Flex(
            direction: orientation == Orientation.portrait
                ? direction
                : direction == Axis.vertical
                    ? Axis.horizontal
                    : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftDiceNum = Random().nextInt(6) + 1;
                    });
                  },
                  style:
                      TextButton.styleFrom(padding: const EdgeInsets.all(50.0)),
                  child: Image.asset("images/dice$leftDiceNum.png"),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftDiceNum = Random().nextInt(6) + 1;
                      rightDiceNum = Random().nextInt(6) + 1;
                    });
                  },
                  style:
                      TextButton.styleFrom(padding: const EdgeInsets.all(50.0)),
                  child: Image.asset("images/dice$rightDiceNum.png"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
