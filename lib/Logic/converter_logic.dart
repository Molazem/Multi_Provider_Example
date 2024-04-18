import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ConverterLogic extends ChangeNotifier{
  String binary = '';
  String octal = '';
  String hexDecimal = '';
  TextEditingController theDecimalNumberController = TextEditingController();
  String input = '0';

  void convert(){
    int theValueOfInput = int.parse(input);
    binary = theValueOfInput.toRadixString(2).toString();
    octal = theValueOfInput.toRadixString(8).toString();
    hexDecimal = theValueOfInput.toRadixString(16).toString();
    notifyListeners();
  }
}