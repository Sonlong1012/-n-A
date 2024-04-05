import 'package:calculator_2sd/buttons_values.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String statement = "";
  String result = "0";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Center(
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

  // statement vs rusult
  Widget resultWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: const Text(
            'statement',
            style: TextStyle(fontSize: 32),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.centerRight,
          child: const Text(
            'result',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  // Button values
  Widget buttonValues() {
    return Wrap(
      children: Btn.buttonValues
          .map((value) => SizedBox(
                width: 80,
                height: 80,
                child: buildButton(value),
              ))
          .toList(),
    );
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
            child: Center(
              child: getIcon(value),
            ),
          ),
        ),
      ),
    );
  }

  //Color
  Color getBtnColor(value) {
    return [Btn.del, Btn.clr].contains(value)
        ? const Color.fromARGB(255, 243, 146, 1)
        : const Color.fromRGBO(80, 80, 80, 1);
  }

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
            : [Btn.powerX3].contains(value)
                ? const Image(image: AssetImage('assets/images/x3.png'))
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
