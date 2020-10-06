import 'package:flutter/material.dart';

class RoundedButtons extends StatelessWidget {

  final List<String> names;

  final buttonText;
  final Widget iconWidget;

  final Function onPress;

  const RoundedButtons(
      {Key key, this.names, @required this.buttonText, @required this.iconWidget, @required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        onPressed: onPress,
        color: Colors.white,
        child: Center(
          child: ListTile(
              leading: iconWidget,
              title: Text("$buttonText", style: TextStyle(fontSize: 14))),
        ),
      ),
    );
  }
}