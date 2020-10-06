import 'dart:math';

import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  final List<String> names;

  const DicePage({Key key, this.names}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  num dice1 = 1;
  num dice2 = 1;
  num index = 0;
  num currentRoll;
  num doubles;
  bool first = true;

  TextStyle allText =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Dice App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: first
                    ? Text(
                        "Let\'s Start",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )
                    :Text(
                            "Current roll: ${widget.names[index]}\nValue: \t\t$currentRoll",
                            style: allText,
                          )),
            SizedBox(
              height: 30,
            ),
            buildLine(context),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                diceButton(dice1),
                diceButton(dice2),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            buildLine(context),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: widget.names.isEmpty
                  ? Text("Free play", style: allText):
              index == widget.names.length-1 || first
                  ? Text(
                  "Turn To Roll: ${widget.names[0]}",
                  style: allText)
                  : Text("Turn to roll: ${widget.names[index+1]}",
                      style: allText),
            ),
          ],
        ),
      ),
    );
  }

  Center buildLine(BuildContext context) {
    return Center(
      child: Container(
        height: 3,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
      ),
    );
  }

  Expanded diceButton(num dice) {
    return Expanded(
      flex: 1,
      child: FlatButton(
        onPressed: () {
            setState(() {
              changeDice();
            });
            print("index: $index\nindex+1: ${index+1}");
        },
        child: Image.asset("images/dice$dice.png"),
      ),
    );
  }

  void changeDice() {


    widget.names.isEmpty ? first = true : first = false;

    dice1 = Random().nextInt(6) + 1;
    dice2 = Random().nextInt(6) + 1;
    currentRoll = dice1 + dice2;

    if( dice1 == dice2 && doubles<2){
      doubles++;
      doubles == 1? index >= widget.names.length - 1 ? index = 0 : index++
          : index = index;
      print ("double: $doubles");
    }
    else {
      doubles == 0
          ? index >= widget.names.length - 1 ? index = 0 : index++
          : index = index;
      doubles = 0;
    }
  }
}
