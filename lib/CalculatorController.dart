// controller.dart
import 'package:flutter/material.dart';
import 'package:calculator_2sd/buttons_values.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;

class CalculatorController {
  // Variable Standard and calulator
  String equation = "0";
  String result = "0";
  String expression = "";
  // Variable Program
  final TextEditingController textDecController = TextEditingController();
  final TextEditingController textHexController = TextEditingController();
  final TextEditingController textOctController = TextEditingController();
  final TextEditingController textBinController = TextEditingController();
  int selectedTextFieldIndex = -1;
  //Logic for Standard Calculator
  void onBtnTapStandard(String value, VoidCallback updateState) {
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
    updateState(); // Gọi hàm updateState() để cập nhật giao diện
  }

  //Logic for Scientific Calculator
  void onBtnTapScientific(String value, VoidCallback updateState) {
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
    updateState();
  }

  //Logic for ProgramCalculator

  selecInput(int numberIndex) {
    selectedTextFieldIndex = numberIndex;
    return selectedTextFieldIndex; //set value slectedTextFielIndex
  }

  void onTapButtonProgram(String value, VoidCallback updateState) {
    if (Btn.clr == value) {
      textDecController.text = "";
      textHexController.text = "";
      textOctController.text = "";
      textBinController.text = "";
    } else if (Btn.del == value) {
      if (selectedTextFieldIndex == 1) {
        textDecController.text = textDecController.text
            .substring(0, textDecController.text.length - 1);
      } else if (selectedTextFieldIndex == 2) {
        textHexController.text = textHexController.text
            .substring(0, textHexController.text.length - 1);
      } else if (selectedTextFieldIndex == 3) {
        textOctController.text = textOctController.text
            .substring(0, textOctController.text.length - 1);
      } else {
        textBinController.text = textBinController.text
            .substring(0, textBinController.text.length - 1);
      }
    } else if (Btn.calculate == value) {
      if (selectedTextFieldIndex == 1) {
        try {
          textHexController.text =
              int.parse(textDecController.text).toRadixString(16).toUpperCase();
          textOctController.text =
              int.parse(textDecController.text).toRadixString(8);
          textBinController.text =
              int.parse(textDecController.text).toRadixString(2);
        } catch (e) {
          textDecController.text = 'erorr';
        }
      } else if (selectedTextFieldIndex == 2) {
        try {
          textDecController.text =
              int.parse(textHexController.text, radix: 16).toString();
          textOctController.text =
              int.parse(textDecController.text).toRadixString(8);
          textBinController.text =
              int.parse(textDecController.text).toRadixString(2);
        } catch (e) {
          textBinController.text = 'erorr';
        }
      } else if (selectedTextFieldIndex == 3) {
        try {
          textDecController.text =
              int.parse(textOctController.text, radix: 8).toString();
          textHexController.text =
              int.parse(textDecController.text).toRadixString(16).toUpperCase();
          textBinController.text =
              int.parse(textDecController.text).toRadixString(2);
        } catch (e) {
          textOctController.text = 'error';
        }
      } else {
        try {
          textDecController.text =
              int.parse(textBinController.text, radix: 2).toString();
          textHexController.text =
              int.parse(textDecController.text).toRadixString(16).toUpperCase();
          textOctController.text =
              int.parse(textDecController.text).toRadixString(8);
        } catch (e) {
          textBinController.text = 'error';
        }
      }
    } else {
      if (selectedTextFieldIndex == 1) {
        if (textDecController.text == "") {
          textDecController.text = value;
        } else {
          textDecController.text = textDecController.text + value;
        }
      } else if (selectedTextFieldIndex == 2) {
        if (textHexController.text == "") {
          textHexController.text = value;
        } else {
          textHexController.text = textHexController.text + value;
        }
      } else if (selectedTextFieldIndex == 3) {
        if (textOctController.text == "") {
          textOctController.text = value;
        } else {
          textOctController.text = textOctController.text + value;
        }
      } else {
        if (textBinController.text == "") {
          textBinController.text = value;
        } else {
          textBinController.text = textBinController.text + value;
        }
      }
    }
    updateState();
  }

  onButtonDecProgram(VoidCallback update) {
    try {
      textHexController.text =
          int.parse(textDecController.text).toRadixString(16).toUpperCase();
      textOctController.text =
          int.parse(textDecController.text).toRadixString(8);
      textBinController.text =
          int.parse(textDecController.text).toRadixString(2);
    } catch (e) {
      textDecController.text = 'erorr';
    }
    update();
  }

  onButtonHexProgram(VoidCallback update) {
    try {
      textDecController.text =
          int.parse(textHexController.text, radix: 16).toString();
      textOctController.text =
          int.parse(textDecController.text).toRadixString(8);
      textBinController.text =
          int.parse(textDecController.text).toRadixString(2);
    } catch (e) {
      textBinController.text = 'erorr';
    }
    update();
  }

  onButtonOctProgram(VoidCallback update) {
    try {
      textDecController.text =
          int.parse(textOctController.text, radix: 8).toString();
      textHexController.text =
          int.parse(textDecController.text).toRadixString(16).toUpperCase();
      textBinController.text =
          int.parse(textDecController.text).toRadixString(2);
    } catch (e) {
      textOctController.text = 'error';
    }
    update();
  }

  onButtonBinProgram(VoidCallback update) {
    try {
      textDecController.text =
          int.parse(textBinController.text, radix: 2).toString();
      textHexController.text =
          int.parse(textDecController.text).toRadixString(16).toUpperCase();
      textOctController.text =
          int.parse(textDecController.text).toRadixString(8);
    } catch (e) {
      textBinController.text = 'error';
    }
    update();
  }
}
