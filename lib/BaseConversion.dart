import 'package:calculator_2sd/navbar.dart';
import 'package:flutter/material.dart';
import 'package:calculator_2sd/buttons_values.dart';

class BaseConversion extends StatefulWidget {
  const BaseConversion({super.key});

  @override
  State<BaseConversion> createState() => _BaseConversionState();
}

class _BaseConversionState extends State<BaseConversion> {
  final TextEditingController _textDecController = TextEditingController();
  final TextEditingController _textHexController = TextEditingController();
  final TextEditingController _textOctController = TextEditingController();
  final TextEditingController _textBinController = TextEditingController();
  int _selectedTextFieldIndex = -1;

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
                    onPressed: onButtonDec,
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
                    controller: _textDecController,
                    onTap: () {
                      _selectedTextFieldIndex = 1;
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
                    onPressed: onButtonHex,
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
                      _selectedTextFieldIndex = 2;
                    },
                    controller: _textHexController,
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
                    onPressed: onButtonOct,
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
                        _selectedTextFieldIndex = 3;
                      });
                    },
                    controller: _textOctController,
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
                    onPressed: onButtonBin,
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
                        _selectedTextFieldIndex = 4;
                      });
                    },
                    controller: _textBinController,
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

  // mapButton() {
  //   return Btn.buttonValuesBaseConverstion
  //       .map((value) => SizedBox(
  //             width: 80,
  //             height: 80,
  //             child: buildButton(value),
  //           ))
  //       .toList();
  // }

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
                onTap: () => onTapButton(value),
                child: Center(
                  child: getIcon(value),
                ),
              ),
            )));
  }

  onButtonDec() {
    setState(() {
      try {
        _textHexController.text =
            int.parse(_textDecController.text).toRadixString(16).toUpperCase();
        _textOctController.text =
            int.parse(_textDecController.text).toRadixString(8);
        _textBinController.text =
            int.parse(_textDecController.text).toRadixString(2);
      } catch (e) {
        _textDecController.text = 'erorr';
      }
    });
  }

  onButtonHex() {
    setState(() {
      try {
        _textDecController.text =
            int.parse(_textHexController.text, radix: 16).toString();
        _textOctController.text =
            int.parse(_textDecController.text).toRadixString(8);
        _textBinController.text =
            int.parse(_textDecController.text).toRadixString(2);
      } catch (e) {
        _textBinController.text = 'erorr';
      }
    });
  }

  onButtonOct() {
    setState(() {
      try {
        _textDecController.text =
            int.parse(_textOctController.text, radix: 8).toString();
        _textHexController.text =
            int.parse(_textDecController.text).toRadixString(16).toUpperCase();
        _textBinController.text =
            int.parse(_textDecController.text).toRadixString(2);
      } catch (e) {
        _textOctController.text = 'error';
      }
    });
  }

  onButtonBin() {
    setState(() {
      try {
        _textDecController.text =
            int.parse(_textBinController.text, radix: 2).toString();
        _textHexController.text =
            int.parse(_textDecController.text).toRadixString(16).toUpperCase();
        _textOctController.text =
            int.parse(_textDecController.text).toRadixString(8);
      } catch (e) {
        _textBinController.text = 'error';
      }
    });
  }

  onTapButton(String value) {
    // _textEditingController.text = number;

    setState(() {
      if (Btn.clr == value) {
        _textDecController.text = "";
        _textHexController.text = "";
        _textOctController.text = "";
        _textBinController.text = "";
      } else if (Btn.del == value) {
        if (_selectedTextFieldIndex == 1) {
          _textDecController.text = _textDecController.text
              .substring(0, _textDecController.text.length - 1);
        } else if (_selectedTextFieldIndex == 2) {
          _textHexController.text = _textHexController.text
              .substring(0, _textHexController.text.length - 1);
        } else if (_selectedTextFieldIndex == 3) {
          _textOctController.text = _textOctController.text
              .substring(0, _textOctController.text.length - 1);
        } else {
          _textBinController.text = _textBinController.text
              .substring(0, _textBinController.text.length - 1);
        }

        // if (_textDecController.text == "") {
        //   _textDecController.text = "";
        // }
      } else if (Btn.calculate == value) {
        if (_selectedTextFieldIndex == 1) {
          try {
            _textHexController.text = int.parse(_textDecController.text)
                .toRadixString(16)
                .toUpperCase();
            _textOctController.text =
                int.parse(_textDecController.text).toRadixString(8);
            _textBinController.text =
                int.parse(_textDecController.text).toRadixString(2);
          } catch (e) {
            _textDecController.text = 'erorr';
          }
        } else if (_selectedTextFieldIndex == 2) {
          try {
            _textDecController.text =
                int.parse(_textHexController.text, radix: 16).toString();
            _textOctController.text =
                int.parse(_textDecController.text).toRadixString(8);
            _textBinController.text =
                int.parse(_textDecController.text).toRadixString(2);
          } catch (e) {
            _textBinController.text = 'erorr';
          }
        } else if (_selectedTextFieldIndex == 3) {
          try {
            _textDecController.text =
                int.parse(_textOctController.text, radix: 8).toString();
            _textHexController.text = int.parse(_textDecController.text)
                .toRadixString(16)
                .toUpperCase();
            _textBinController.text =
                int.parse(_textDecController.text).toRadixString(2);
          } catch (e) {
            _textOctController.text = 'error';
          }
        } else {
          try {
            _textDecController.text =
                int.parse(_textBinController.text, radix: 2).toString();
            _textHexController.text = int.parse(_textDecController.text)
                .toRadixString(16)
                .toUpperCase();
            _textOctController.text =
                int.parse(_textDecController.text).toRadixString(8);
          } catch (e) {
            _textBinController.text = 'error';
          }
        }
      } else {
        if (_selectedTextFieldIndex == 1) {
          if (_textDecController.text == "") {
            _textDecController.text = value;
          } else {
            _textDecController.text = _textDecController.text + value;
          }
        } else if (_selectedTextFieldIndex == 2) {
          if (_textHexController.text == "") {
            _textHexController.text = value;
          } else {
            _textHexController.text = _textHexController.text + value;
          }
        } else if (_selectedTextFieldIndex == 3) {
          if (_textOctController.text == "") {
            _textOctController.text = value;
          } else {
            _textOctController.text = _textOctController.text + value;
          }
        } else {
          if (_textBinController.text == "") {
            _textBinController.text = value;
          } else {
            _textBinController.text = _textBinController.text + value;
          }
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
