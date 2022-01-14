import 'package:calculator/widgets/calc_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _operandOne = "";
  String _operandTwo = "";
  String _operator = "";

  void _numPressed(String num) {
    setState(() {
      _operandTwo += num;
    });
  }

  String _formatCalcField(String s) {
    double d = double.parse(s);
    if (d % d.roundToDouble() == 0) {
      // we have an int, so we don't need that x.00
      return d.toInt().toString();
    } else {
      return d.toString();
    }
  }

  void _opPressed(String op) {
    switch (op) {
      case "AC":
        setState(() {
          _operandOne = "";
          _operandTwo = "";
          _operator = "";
        });
        break;
      case "+/-":
        setState(() {
          if (_operandTwo.contains(".")) {
            _operandTwo = (double.parse(_operandTwo) * -1).toString();
          } else {
            _operandTwo = (int.parse(_operandTwo) * -1).toString();
          }
        });
        break;
      case "%":
        setState(() {
          _operandTwo = (double.parse(_operandTwo) / 100).toString();
        });
        break;
      case "/":
        setState(() {
          _operandOne = _operandTwo;
          _operator = "/";
          _operandTwo = "";
        });
        break;
      case "*":
        setState(() {
          _operandOne = _operandTwo;
          _operator = "*";
          _operandTwo = "";
        });
        break;
      case "-":
        setState(() {
          _operandOne = _operandTwo;
          _operator = "-";
          _operandTwo = "";
        });
        break;
      case "+":
        setState(() {
          _operandOne = _operandTwo;
          _operator = "+";
          _operandTwo = "";
        });
        break;
      case "=":
        setState(() {
          double operand1 = double.parse(_operandOne);
          double operand2 = double.parse(_operandTwo);
          _operandOne = _operandOne + " " + _operator + " " + _operandTwo;
          if (_operator == "/") {
            _operandTwo = _formatCalcField((operand1 / operand2).toString());
          } else if (_operator == "*") {
            _operandTwo = _formatCalcField((operand1 * operand2).toString());
          } else if (_operator == "-") {
            _operandTwo = _formatCalcField((operand1 - operand2).toString());
          } else if (_operator == "+") {
            _operandTwo = _formatCalcField(((operand1 + operand2).toString()));
          }
          _operator = "=";
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(
                      _operandOne,
                      style: const TextStyle(
                        fontSize: 60,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                    child: Text(
                      _operator,
                      style: const TextStyle(
                        fontSize: 50,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                    child: Text(
                      _operandTwo,
                      style: const TextStyle(
                          fontSize: 60, overflow: TextOverflow.fade),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: "AC", type: 3, callback: _opPressed),
                  CalculatorButton(text: "+/-", type: 3, callback: _opPressed),
                  CalculatorButton(text: "%", type: 3, callback: _opPressed),
                  CalculatorButton(text: "/", type: 2, callback: _opPressed),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: "7", type: 1, callback: _numPressed),
                  CalculatorButton(text: "8", type: 1, callback: _numPressed),
                  CalculatorButton(text: "9", type: 1, callback: _numPressed),
                  CalculatorButton(text: "*", type: 2, callback: _opPressed),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: "4", type: 1, callback: _numPressed),
                  CalculatorButton(text: "5", type: 1, callback: _numPressed),
                  CalculatorButton(text: "6", type: 1, callback: _numPressed),
                  CalculatorButton(text: "-", type: 2, callback: _opPressed),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: "1", type: 1, callback: _numPressed),
                  CalculatorButton(text: "2", type: 1, callback: _numPressed),
                  CalculatorButton(text: "3", type: 1, callback: _numPressed),
                  CalculatorButton(text: "+", type: 2, callback: _opPressed),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: "0", type: 1, callback: _numPressed),
                  CalculatorButton(text: "00", type: 1, callback: _numPressed),
                  CalculatorButton(text: ".", type: 1, callback: _numPressed),
                  CalculatorButton(text: "=", type: 2, callback: _opPressed),
                ],
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
