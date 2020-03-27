import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  final leftDiceKeyState = GlobalKey<_DiceButtonState>();
  final rightDiceKeyState = GlobalKey<_DiceButtonState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: DiceButton(
                key: leftDiceKeyState,
              ),
            ),
            Expanded(
              child: DiceButton(
                key: rightDiceKeyState,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  leftDiceKeyState.currentState.setRandomDiceNumber();
                  rightDiceKeyState.currentState.setRandomDiceNumber();
                });
              },
              child: Icon(Icons.play_arrow),
              backgroundColor: Colors.black,
            ),
          ],
        ),
      ],
    );
  }
}

class DiceButton extends StatefulWidget {
  final int initialDiceNumber;

  const DiceButton({Key key, this.initialDiceNumber = 1}) : super(key: key);

  @override
  _DiceButtonState createState() => _DiceButtonState();
}

class _DiceButtonState extends State<DiceButton> {
  int diceNumber;

  @override
  void initState() {
    super.initState();
    diceNumber = widget.initialDiceNumber;
  }

  void setRandomDiceNumber() {
    diceNumber = 1 + Random().nextInt(6);
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          setRandomDiceNumber();
        });
      },
      child: Image.asset('images/dice$diceNumber.png'),
    );
  }
}
