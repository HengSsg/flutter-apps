import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Dice game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(
                      child: Image.asset(
                    'image/dice$leftDice.png',
                    width: 150,
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Image.asset(
                    'image/dice$rightDice.png',
                    width: 150,
                  )),
                ],
              ),
            ),
            ButtonTheme(
              minWidth: 100,
              height: 60,
              child: ElevatedButton(
                onPressed: (() {
                  setState(() {
                    leftDice = Random().nextInt(6) + 1;
                    rightDice = Random().nextInt(6) + 1;
                  });
                  showToast("Left dice: {$leftDice}, Right dice: {$rightDice}");
                }),

                child: Icon(
                  Icons.arrow_forward,
                  size: 50,
                ),
                style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0
  );
}
