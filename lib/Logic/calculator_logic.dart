import 'package:flutter/foundation.dart';

class CalLogic extends ChangeNotifier {
  //final List<String> _inputStack = [];
  double _result = 0.0; // Stores the previous result for calculations
  String _currentOperand = ""; // Stores the current operand (+, -, etc.)
  String _displayNumber = ""; // Stores the number displayed on the screen
  String _thePreviousNumber = '';
  bool _isNegative = false;

  String get displayNumber => _displayNumber;
  String get thePreviousNumber => _thePreviousNumber;


  // Mathematical functions
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
  bool _positiveOrNegative(String input) => input.contains('pn');
  bool _isBack(String input) => input.contains('⌫');

  // Logic functions
  void _handleOperation(String input) {
    switch (input) {
      case '+':
      case '-':
      case 'x':
      case '÷':
        _currentOperand = input;
        _result = double.parse(_displayNumber); // Store previous result
        _thePreviousNumber = '$_displayNumber $_currentOperand';
        _displayNumber = ""; // Reset display for next operand
        break;
      case '%':
          _result = double.parse(_displayNumber);
          _displayNumber = _calculateResult(_result, null, '%').toString();
      case '=':
        double secondOperand = double.parse(_displayNumber);
        _thePreviousNumber = _formatOutput(secondOperand);
        _displayNumber = _formatOutput(_calculateResult(_result, secondOperand, _currentOperand));
        _currentOperand = ""; // Clear current operand after calculation
        _result = double.parse(_displayNumber); // Update result for further calculations
        break;
      default:
        break;
    }
    notifyListeners();
  }

  double _calculateResult(double num1, double? num2, String operand) {
    switch (operand) {
      case '+':
        return _add(num1, num2!);
      case '-':
        return _subtract(num1, num2!);
      case 'x':
        return _multiplication(num1, num2!);
      case '÷':
        return _division(num1, num2!);
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
    } else if(_positiveOrNegative(input)){
      _isNegative = !_isNegative; // Toggle the sign
      _handlePositiveOrNegative(_isNegative);
    }else if(_isBack(input)){
      _handleBack();
    } else if (input.isNotEmpty && !_isOperator(input)) {
      // Allow only valid numeric characters
      _displayNumber += input;
    }
    notifyListeners();
  }

  String _formatOutput(double myDouble){

    // Check if trailing digit is zero
    bool hasTrailingZero = (myDouble % 1) == 0.0;

    if (hasTrailingZero) {
      // Remove decimal if trailing digit is zero
      return myDouble.floor().toString();
    } else {
      // Keep decimal point otherwise
      return  myDouble.toString();
    }

  }

  void _handleBack(){
    _displayNumber = _displayNumber.substring(0, _displayNumber.length - 1);
    notifyListeners();
  }

  void _handlePositiveOrNegative(bool isNegative){
    if(isNegative == true) {
      _displayNumber = '-$_displayNumber';
    }else if(_displayNumber.startsWith('-')){
      _displayNumber = _displayNumber.substring(1, _displayNumber.length);
    }
    notifyListeners();
  }

  void _clearState() {
    _result = 0.0;
    _currentOperand = "";
    _thePreviousNumber = '';
    _displayNumber = "";
    notifyListeners();
  }
}

