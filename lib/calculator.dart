import 'dart:math' as math;

import 'package:math_expressions/math_expressions.dart';
import 'package:calculator_2sd/buttons_values.dart';
import 'package:flutter/material.dart';

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
  bool isOverlayVisible = false;
  void _toggleOverlayVisibility() {
    setState(() {
      isOverlayVisible = !isOverlayVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
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
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                flex: 2,
                child: resultWidget(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(80, 40),
                            backgroundColor:
                                const Color.fromARGB(255, 243, 146, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () => {_toggleOverlayVisibility()},
                        child: const Center(
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.black,
                            size: 27,
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    buttonValues(),
                    Container(
                      padding: const EdgeInsets.only(left: 140),
                      child: Visibility(
                          visible: isOverlayVisible,
                          child: Container(
                            width: 250,
                            height: 220,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: const Color.fromARGB(255, 57, 57, 57),
                                borderRadius: BorderRadius.circular(15)),
                            child: buttonValuesVisibility(),
                          )),
                    ),
                  ],
                ),
              ),
            ],
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                equation,
                style: const TextStyle(fontSize: 32),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.centerRight,
          child: Text(result,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }

  // Map Button values
  Widget buttonValues() {
    return Wrap(children: mapButton());
  }

  mapButton() {
    var newList = List.from(Btn.buttonValuesScientific)
      ..addAll(Btn.buttonValuesStandard);
    swapByValue(newList, Btn.clr, Btn.e);
    swapByValue(newList, Btn.del, Btn.ln);
    return newList
        .map((value) => SizedBox(
              width: 78,
              height: 70,
              child: buildButton(value),
            ))
        .toList();
  }

  swapByValue(List list, value1, value2) {
    var index1 = list.indexOf(value1);
    var index2 = list.indexOf(value2);
    if (index1 != -1 && index2 != -1) {
      var temp = list[index1];
      list[index1] = list[index2];
      list[index2] = temp;
    }
  }

  //Map button values for visibility
  Widget buttonValuesVisibility() {
    return Wrap(children: mapButtonVisibility());
  }

  mapButtonVisibility() {
    return Btn.buttonValuesVisibility
        .map((value) => SizedBox(
              width: 78,
              height: 70,
              child: buildButton(value),
            ))
        .toList();
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
      // var element = equation.split(RegExp('[-+*/]'));

      // var lastElenment = element.last;
      // var indexOfTarget = equation.indexOf(lastElenment);
      if (Btn.clr == value) {
        equation = "0";
        result = "0";
      } else if (Btn.del == value) {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (Btn.posNeg == value) {
        if (equation[0] != '-') {
          equation = '-$equation';
        } else {
          equation = equation.substring(1);
        }
      } else if (Btn.cos == value || Btn.sin == value || Btn.tan == value) {
        equation = '(($equation*π)/180)';
        if (value == Btn.cos) {
          equation = 'cos$equation';
        }
        if (value == Btn.sin) {
          equation = 'sin$equation';
        }
        if (value == Btn.tan) {
          equation = 'tan$equation';
        }
      } else if (Btn.calculate == value) {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '/100');
        expression = expression.replaceAll('e', '${math.e}');
        expression = expression.replaceAll('π', '${math.pi}');

        try {
          Parser p = Parser();
          var exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
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
            : [Btn.sqrtX].contains(value)
                ? const Image(image: AssetImage('assets/images/sqrtx.png'))
                : [Btn.perX].contains(value)
                    ? const Image(image: AssetImage('assets/images/perX.png'))
                    : [Btn.powerXn].contains(value)
                        ? const Image(image: AssetImage('assets/images/xn.png'))
                        : [Btn.nrt].contains(value)
                            ? const Image(
                                image: AssetImage('assets/images/nsqrtx.png'))
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
