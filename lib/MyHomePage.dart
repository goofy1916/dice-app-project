import 'dart:math';

import 'package:flutter/material.dart';

import 'DicePage.dart';
import 'RoundedButtons.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> names = [];
  TextEditingController nameEntered = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text(
                "Add Players or Roll Dice.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: nameEntered,
                style: TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.white12,
                decoration: InputDecoration(
                  hintText: "Enter Player Name",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RoundedButtons(
                      iconWidget: Icon(
                        Icons.person,
                        color: Colors.green,
                        size: 30,
                      ),
                      buttonText: "Add Player",
                      onPress: () {
                        nameEntered.text.isEmpty
                            // ignore: unnecessary_statements
                            ? null
                            : setState(() {
                          names.add(nameEntered.text.toString());
                          nameEntered.clear();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: RoundedButtons(
                      names: names,
                      iconWidget: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green,
                        ),
                        height: 30,
                        width: 30,
                        child: Image.asset(
                            "images/dice${Random().nextInt(6) + 1}.png"),
                      ),
                      buttonText: "Roll Dice!",
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DicePage(
                                names: names,
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButtons(
                buttonText: "Reset!",
                iconWidget: Icon(
                  Icons.refresh,
                  color: Colors.green,
                  size: 30,
                ),
                onPress: () {
                  setState(() {
                    names.clear();
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
              names.isEmpty
                  ? Center(
                child: Text(
                  "No players joined!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              )
                  : Container(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          Icons.videogame_asset,
                          color: Colors.white,
                          size: 40,
                        ),
                        title: Text(
                          "${names[index]}",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}