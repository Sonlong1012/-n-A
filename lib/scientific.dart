import 'package:flutter/material.dart';
import 'package:calculator_2sd/buttons_values.dart';
import 'package:calculator_2sd/navbar.dart';
import 'package:calculator_2sd/CalculatorController.dart';

class Scientific extends StatefulWidget {
  const Scientific({super.key});

  @override
  State<Scientific> createState() => _ScientificState();
}

class _ScientificState extends State<Scientific> {
  final CalculatorController _controller = CalculatorController();
  bool isOverlayVisible = false;

  void _toggleOverlayVisibility() {
    setState(() {
      isOverlayVisible = !isOverlayVisible;
    });
  }

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
                        onPressed: _toggleOverlayVisibility,
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
                    Visibility(
                        visible: isOverlayVisible,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: const Color.fromARGB(255, 57, 57, 57),
                              borderRadius: BorderRadius.circular(15)),
                          child: buttonValuesVisibility(),
                        )),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }

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
                _controller.equation,
                style: const TextStyle(fontSize: 32),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.centerRight,
          child: Text(_controller.result,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }

  Widget buttonValues() {
    return Wrap(children: mapButton());
  }

  List<Widget> mapButton() {
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

  void swapByValue(List list, value1, value2) {
    var index1 = list.indexOf(value1);
    var index2 = list.indexOf(value2);
    if (index1 != -1 && index2 != -1) {
      var temp = list[index1];
      list[index1] = list[index2];
      list[index2] = temp;
    }
  }

  Widget buttonValuesVisibility() {
    return Wrap(children: mapButtonVisibility());
  }

  List<Widget> mapButtonVisibility() {
    return Btn.buttonValuesVisibility
        .map((value) => SizedBox(
              width: 78,
              height: 70,
              child: buildButton(value),
            ))
        .toList();
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
            onTap: () =>
                _controller.onBtnTapScientific(value, () => setState(() {})),
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
    } else if (value == Btn.powerXn) {
      return const Image(image: AssetImage('assets/images/xn.png'));
    } else if (value == Btn.nrt) {
      return const Image(image: AssetImage('assets/images/nsqrtx.png'));
    } else if (value == Btn.permutation) {
      return const Image(image: AssetImage('assets/images/n!.png'));
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
