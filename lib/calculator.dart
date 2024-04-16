import 'package:calculator_2sd/buttons_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator_2sd/navbar.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "0";
  String equation = "0";
  String expression = "";
  bool buttonChange = false;
  // void testValue(String value) {
  //   result = value;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 100),
          child: Text(
            "Scientific",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: resultWidget(),
          ),
          Expanded(
            flex: 3,
            child: buttonValues(),
          )
        ],
      ),
    ));
  }

  // statement vs rusult vs button change
  Widget resultWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Text(
            equation,
            style: const TextStyle(fontSize: 32),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.centerRight,
          child: Text(
            result,
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 243, 146, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () => {
                        setState(() {
                          buttonChange =
                              !buttonChange; // Toggle the value of buttonChange
                        })
                      },
                  child: const Icon(
                    Icons.more_outlined,
                    color: Colors.black,
                    size: 30,
                  ))
            ],
          ),
        ),
      ],
    );
  }

  // Map Button values
  Widget buttonValues() {
    return Wrap(children: mapButton());
  }

  mapButton() {
    if (buttonChange) {
      var newList = List.from(Btn.buttonValues);
      newList.replaceRange(0, 3, [Btn.tan, Btn.sin, Btn.cos]);
      return newList
          .map((value) => SizedBox(
                width: 80,
                height: 80,
                child: buildButton(value),
              ))
          .toList();
    } else {
      return Btn.buttonValues
          .map((value) => SizedBox(
                width: 80,
                height: 80,
                child: buildButton(value),
              ))
          .toList();
    }
  }

  // Build Button
  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 16, 16, 16),
                offset: Offset(0, 5),
                // spreadRadius: BorderSide.strokeAlignOutside,
                blurRadius: 5.0,
              ),
            ]),
        child: Material(
          type: MaterialType.canvas,
          color: getBtnColor(value),
          clipBehavior: Clip.hardEdge,
          shape: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(39, 40, 40, 1),
              ),
              borderRadius: BorderRadius.circular(25)),
          child: InkWell(
            onTap: () => onBtnTap(value),
            child: Center(
              child: getIcon(value),
            ),
          ),
        ),
      ),
    );
  }

  onBtnTap(String value) {
    setState(() {
      if (Btn.clr == value) {
        equation = "0";
        result = "0";
      } else if (Btn.del == value) {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (Btn.calculate == value) {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '/100');
        try {
          Parser p = Parser();
          var exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result =
              '${exp.evaluate(EvaluationType.REAL, cm).toStringAsFixed(2)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = value;
        } else {
          equation = equation + value;
        }
      }
    });
  }

  //Color
  Color getBtnColor(value) {
    return [Btn.del, Btn.clr].contains(value)
        ? const Color.fromARGB(255, 243, 146, 1)
        : const Color.fromRGBO(80, 80, 80, 1);
  }

  //Color value
  Color getTextColor(value) {
    return [Btn.del, Btn.clr].contains(value) ? Colors.black : Colors.white;
  }

  //Icon
  Widget getIcon(value) {
    return [Btn.del].contains(value)
        ? const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
            size: 30,
          )
        : [Btn.squareX].contains(value)
            ? const Image(
                image: AssetImage('assets/images/x2.png'),
              )
            : [Btn.powerXn].contains(value)
                ? const Image(image: AssetImage('assets/images/xn.png'))
                : [Btn.perX].contains(value)
                    ? const Image(image: AssetImage('assets/images/perX.png'))
                    : [Btn.permutation].contains(value)
                        ? const Image(image: AssetImage('assets/images/n!.png'))
                        : Text(
                            value,
                            style: TextStyle(
                              color: getTextColor(value),
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          );
  }
}
