import 'package:flutter/foundation.dart';

class CalLogic extends ChangeNotifier {
  final List<String> _inputStack = [];
  double _result = 0.0; // Stores the previous result for calculations
  String _currentOperand = ""; // Stores the current operand (+, -, etc.)
  String _displayNumber = ""; // Stores the number displayed on the screen
  bool _isNegative = false;

  String get displayNumber => _displayNumber;

  // Operation functions
  double _add(double num1, double num2) => num1 + num2;
  double _subtract(double num1, double num2) => num1 - num2;
  double _multiplication(double num1, double num2) => num1 * num2;
  double _division(double num1, double num2) {
    if (num2 == 0) {
      throw Exception("Division by zero!"); // Handle division by zero
    }
    return num1 / num2;
  }
  double _percentage(double num) => num / 100;


  // Check functions
  bool _isOperator(String input) => (input.contains('+') || input.contains('-') || input.contains('x') || input.contains('÷') || input.contains('=') || input.contains('%'));
  bool _isAC(String input) => input.contains('AC');
  bool _isDecimal(String input) => input.contains('.');
  bool _positiveOrNegative(String input) => input.contains('+/-');

  // Logic functions
  void _handleOperation(String input) {
    switch (input) {
      case '+':
      case '-':
      case 'x':
      case '÷':
        _currentOperand = input;
        _result = double.parse(_displayNumber); // Store previous result
        _displayNumber = ""; // Reset display for next operand
        break;
      case '%':
          _displayNumber = _calculateResult(_result, 0, input).toString();
      case '=':
        double secondOperand = double.parse(_displayNumber);
        _displayNumber = _calculateResult(_result, secondOperand, _currentOperand).toString();
        _currentOperand = ""; // Clear current operand after calculation
        _result = double.parse(_displayNumber); // Update result for further calculations
        break;
      default:
        break;
    }
    notifyListeners();
  }

  double _calculateResult(double num1, double num2, String operand) {
    switch (operand) {
      case '+':
        return _add(num1, num2);
      case '-':
        return _subtract(num1, num2);
      case 'x':
        return _multiplication(num1, num2);
      case '÷':
        return _division(num1, num2);
      case '%':
        return _percentage(num1);
      default:
        return num1;
    }
  }

  // State functions
  void handleInput(String input) {
    if (_isAC(input)) {
      _clearState();
    } else if (_isOperator(input)) {
      _handleOperation(input);
    } else if (_isDecimal(input) && !_displayNumber.contains('.')) {
      _displayNumber += input;
    } else if (input.isNotEmpty && !_isOperator(input)) {
      // Allow only valid numeric characters
      _displayNumber += input;
    }else if(_positiveOrNegative(input)){
      _isNegative = !_isNegative; // Toggle the sign
      _displayNumber = (_isNegative ? '-' : '') + _displayNumber;
    }
    notifyListeners();
  }

  void _clearState() {
    _inputStack.clear();
    _result = 0.0;
    _currentOperand = "";
    _displayNumber = "";
    notifyListeners();
  }
}

