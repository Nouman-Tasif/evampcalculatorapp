import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:math_expressions/math_expressions.dart';

class CalculatorModel extends ChangeNotifier {

  String expressions = "";
  String result = "";

  String get expression => expressions;
  String get resultText => result;

  void addToExpression(String value) {
    expressions += value;
    result += value;
    notifyListeners();
  }

  void clearExpressionMethod() {
    expressions = "";
    result = "";
    notifyListeners();
  }

  void multiply() {
    addToExpression("*");
    notifyListeners();
  }

  void addNumber() {
    addToExpression("+");
    notifyListeners();
  }

  void subtractNumber() {
    addToExpression("-");
    notifyListeners();
  }

  void divideNumber() {
    addToExpression("/");
    notifyListeners();
  }

  void evaluateExpression() {
    try {
      final expression = Parser().parse(expressions);
      final context = ContextModel();
      final evaluation = expression.evaluate(EvaluationType.REAL, context);
      result = evaluation.toStringAsFixed(0);
    } catch (e) {
      result = 'Error';
    }
    notifyListeners();
  }


  void cancelButton() {
    if (expressions.isNotEmpty) {
      expressions = expressions.substring(0, expressions.length - 1);
      result = "";
      notifyListeners();
    }
  }
}
