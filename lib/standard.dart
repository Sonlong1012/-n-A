import 'package:calculator_2sd/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator_2sd/buttons_values.dart';
import 'package:calculator_2sd/CalculatorController.dart';

class Standard extends StatefulWidget {
  const Standard({super.key});

  @override
  State<Standard> createState() => _StandardState();
}

class _StandardState extends State<Standard> {
  final CalculatorController _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Navbar(),
        appBar: AppBar(
          title: const Center(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget resultWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              _controller.equation,
              style: const TextStyle(fontSize: 32),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.centerRight,
          child: Text(
            _controller.result,
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget buttonValues() {
    return Wrap(children: mapButton());
  }

  List<Widget> mapButton() {
    return Btn.buttonValuesStandard.map((value) {
      return SizedBox(
        width: 80,
        height: 80,
        child: buildButton(value),
      );
    }).toList();
  }

  Widget buildButton(String value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 16, 16, 16),
              offset: Offset(0, 5),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Material(
          type: MaterialType.canvas,
          color: getBtnColor(value),
          clipBehavior: Clip.hardEdge,
          shape: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(39, 40, 40, 1),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: InkWell(
            onTap: () =>
                _controller.onBtnTapStandard(value, () => setState(() {})),
            child: Center(
              child: getIcon(value),
            ),
          ),
        ),
      ),
    );
  }

  Color getBtnColor(String value) {
    return [Btn.del, Btn.clr].contains(value)
        ? const Color.fromARGB(255, 243, 146, 1)
        : const Color.fromRGBO(80, 80, 80, 1);
  }

  Color getTextColor(String value) {
    return [Btn.del, Btn.clr].contains(value) ? Colors.black : Colors.white;
  }

  Widget getIcon(String value) {
    if (value == Btn.del) {
      return const Icon(
        Icons.arrow_back_outlined,
        color: Colors.black,
        size: 30,
      );
    } else if (value == Btn.squareX) {
      return const Image(
        image: AssetImage('assets/images/x2.png'),
      );
    } else if (value == Btn.sqrtX) {
      return const Image(image: AssetImage('assets/images/sqrtx.png'));
    } else if (value == Btn.perX) {
      return const Image(image: AssetImage('assets/images/perX.png'));
    } else {
      return Text(
        value,
        style: TextStyle(
          color: getTextColor(value),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      );
    }
  }
}
