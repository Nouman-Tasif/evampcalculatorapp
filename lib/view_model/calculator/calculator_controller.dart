
import 'package:flutter/foundation.dart';

import '../../model/calculator_model/calculator.dart';


class CalculatorViewModel {
  final CalculatorModel model;

  CalculatorViewModel({required this.model});

  void addToExpression(String value) {
    model.addToExpression(value);
  }

  void clearExpression() {
    model.clearExpressionMethod();
  }

  void multiply() {
    model.multiply();
  }

  void add() {
    model.addNumber();
  }
  void subtract() {
    model.subtractNumber();
  }
  void divideNumber() {
    model.divideNumber();
  }
void oneDigitCancel(){
    model.cancelButton();
}
  void evaluateExpression() {
    model.evaluateExpression();
  }

}
