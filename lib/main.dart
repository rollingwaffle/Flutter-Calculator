// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Calculator",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({Key? key}) : super(key: key);

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String num1 = "";
  String num2 = "";
  String operator = "";
  double result = 0;
  var numArr = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  var operatorVal = ["+", "-", "*", "/"];

  void btnPressed(String buttonValue) {
    setState(() {
      if (operator.isEmpty && numArr.contains(buttonValue)) {
        num1 = num1 + buttonValue;
      } else if (result == 0 &&
          num1.isNotEmpty &&
          operatorVal.contains(buttonValue)) {
        operator = buttonValue;
      } else if (operator.isNotEmpty && numArr.contains(buttonValue)) {
        num2 = num2 + buttonValue;
      } else if (buttonValue == "=") {
        double firstNum = double.parse(num1);
        double secondNum = double.parse(num2);
        if (operator == '+') {
          result = (firstNum) + (secondNum);
        } else if (operator == '-') {
          result = (firstNum) - (secondNum);
        } else if (operator == '%') {
          result = (firstNum) % (secondNum);
        } else if (operator == '/') {
          result = (firstNum) / (secondNum);
        } else if (operator == '*') {
          result = (firstNum) * (secondNum);
        }
      } else if (buttonValue == 'C') {
        num1 = "";
        num2 = "";
        operator = "";
        result = 0;
      } else if (result != 0) {
        num1 = result.toString();
        operator = buttonValue;
        num2 = "";
      }
    });
  }

  Widget buttons(String buttonValue) {
    return Container(
      margin: EdgeInsets.all(8.5),
      // child: Expanded(
      child: RaisedButton(
        padding: EdgeInsets.all(8),
        onPressed: () => btnPressed(buttonValue),
        child: Text(
          buttonValue,
          style: TextStyle(color: Colors.deepPurple, fontSize: 25, height: 2.5),
        ),
      ),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                      child: Text(
                        "$num1", style: TextStyle(fontSize: 24),
                        // "$num1",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        "$operator", style: TextStyle(fontSize: 24),
                        // "$num1",
                      ),
                    ),
                    Text(
                      "$num2", style: TextStyle(fontSize: 24),
                      // "$num1",
                    )
                  ],
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            Expanded(
              child: Container(
                child: Text(
                  "$result",
                  style: TextStyle(fontSize: 30),
                ),
                alignment: Alignment.centerRight,
              ),
            ),
            Row(
              children: <Widget>[
                buttons("7"),
                buttons("8"),
                buttons("9"),
                buttons("+"),
              ],
            ),
            Row(
              children: <Widget>[
                buttons("4"),
                buttons("5"),
                buttons("6"),
                buttons("-"),
              ],
            ),
            Row(
              children: <Widget>[
                buttons("1"),
                buttons("2"),
                buttons("3"),
                buttons("*"),
              ],
            ),
            Row(
              children: <Widget>[
                buttons("C"),
                buttons("0"),
                buttons("/"),
                buttons("="),
              ],
            )
          ],
        ),
      ),
    );
  }
}
