import 'package:calculator_2sd/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator_2sd/buttons_values.dart';
import 'package:math_expressions/math_expressions.dart';

class Standard extends StatefulWidget {
  const Standard({super.key});

  @override
  State<Standard> createState() => _StandardState();
}

class _StandardState extends State<Standard> {
  String result = "0";
  String equation = "0";
  String expression = "";
  bool buttonChange = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 100),
          child: Text(
            "Standard",
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
    return Btn.buttonValuesStandard
        .map((value) => SizedBox(
              width: 80,
              height: 80,
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
      } else if (Btn.calculate == value) {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '/100');
        expression = expression.replaceAll('\u221A', 'sqrt');

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
                    // : [Btn.permutation].contains(value)
                    //     ? const Image(image: AssetImage('assets/images/n!.png'))
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
