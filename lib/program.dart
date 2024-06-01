import 'package:calculator_2sd/navbar.dart';
import 'package:flutter/material.dart';
import 'package:calculator_2sd/buttons_values.dart';
import 'package:calculator_2sd/CalculatorController.dart';

class Program extends StatefulWidget {
  const Program({super.key});

  @override
  State<Program> createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  final CalculatorController _controller = CalculatorController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            "BaseConversion",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: resultWidget(),
          ),
          Expanded(
            flex: 1,
            child: buttonValues(context),
          )
        ],
      ),
    ));
  }

  Widget resultWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor:
                            const Color.fromARGB(255, 243, 146, 1)),
                    onPressed: () =>
                        _controller.onButtonDecProgram(() => setState(() {})),
                    child: const Icon(Icons.replay_circle_filled_outlined,
                        color: Colors.black)),
                const Text(
                  'DEC',
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: _controller.textDecController,
                    onTap: () {
                      _controller.selecInput(1);
                    },
                    readOnly: true,
                    decoration: const InputDecoration(hintText: 'Dec'),
                  ),
                ))
              ],
            )),
        Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor:
                            const Color.fromARGB(255, 243, 146, 1)),
                    onPressed: () =>
                        _controller.onButtonHexProgram(() => setState(() {})),
                    child: const Icon(Icons.replay_circle_filled_outlined,
                        color: Colors.black)),
                const Text(
                  'HEX',
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    onTap: () {
                      _controller.selecInput(2);
                    },
                    controller: _controller.textHexController,
                    readOnly: true,
                    decoration: const InputDecoration(hintText: 'Hex'),
                  ),
                ))
              ],
            )),
        Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor:
                            const Color.fromARGB(255, 243, 146, 1)),
                    onPressed: () =>
                        _controller.onButtonOctProgram(() => setState(() {})),
                    child: const Icon(Icons.replay_circle_filled_outlined,
                        color: Colors.black)),
                const Text(
                  'OCT',
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    onTap: () {
                      setState(() {
                        _controller.selecInput(3);
                      });
                    },
                    controller: _controller.textOctController,
                    readOnly: true,
                    decoration: const InputDecoration(hintText: 'Oct'),
                  ),
                ))
              ],
            )),
        Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor:
                            const Color.fromARGB(255, 243, 146, 1)),
                    onPressed: () =>
                        _controller.onButtonBinProgram(() => setState(() {})),
                    child: const Icon(Icons.replay_circle_filled_outlined,
                        color: Colors.black)),
                const Text(
                  'BIN',
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    onTap: () {
                      setState(() {
                        _controller.selecInput(4);
                      });
                    },
                    controller: _controller.textBinController,
                    readOnly: true,
                    decoration: const InputDecoration(hintText: 'Bin'),
                  ),
                ))
              ],
            )),
      ],
    );
  }

  // Map Button values
  Widget buttonValues(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Wrap(
        children: Btn.buttonValuesBaseConverstion
            .map((value) => SizedBox(
                  width: value == Btn.calculate
                      ? screenSize.width / 2
                      : (screenSize.width / 4),
                  height: 70,
                  child: buildButton(value),
                ))
            .toList());
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
                onTap: () => _controller.onTapButtonProgram(
                    value, () => setState(() {})),
                child: Center(
                  child: getIcon(value),
                ),
              ),
            )));
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
