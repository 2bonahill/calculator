import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int type;
  final Function callback;

  const CalculatorButton(
      {Key? key,
      required this.text,
      required this.type,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: TextButton(
        onPressed: () {
          callback(text);
        },
        child: Text(
          text,
          style: TextStyle(
              color: type == 2 ? Colors.blueGrey : Colors.white, fontSize: 24),
        ),
        style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: type == 1
                ? Colors.pinkAccent
                : type == 2
                    ? Colors.greenAccent
                    : Colors.blueAccent,
            minimumSize: const Size(70, 70),
            shape: const CircleBorder()),
      ),
    );
  }
}
