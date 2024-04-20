import 'package:flutter/foundation.dart';

class MoneyBoxLogic extends ChangeNotifier{
  int _onePaperPound = 0;
  int _oneMetalPound = 0;
  int _fivePounds = 0;
  int _tenPounds = 0;
  int _twentyPounds = 0;
  int _fiftyPounds = 0;
  int _hundredPounds = 0;
  int _twoHundredPounds = 0;
  int _total = 0;
  double _convertedTotal = 0.0;
  bool _isDollar = true;
  String _outPut = '';

  bool get isDollar => _isDollar;

  int get onePaperPoundAmount => _onePaperPound;

  int get oneMetalPoundAmount => _oneMetalPound;

  int get fivePoundsAmount => _fivePounds;

  int get tenPoundsAmount => _tenPounds;

  int get twentyPoundsAmount => _twentyPounds;

  int get fiftyPoundsAmount => _fiftyPounds;

  int get hundredPoundsAmount => _hundredPounds;

  int get twoHundredPoundsAmount => _twoHundredPounds;

  int get total => _total;

  String get outPut => _outPut;


  void dollarOrEuro(){
    _isDollar = !_isDollar;
    _convertedTotal = _isDollar? _total*0.021 : _total * 0.019;
    theOutPut();
    notifyListeners();
  }

  double _calculatedConversion(int value){
    if(_isDollar){
      return value * 0.021;
    }else{
      return value * 0.019;
    }

  }

  void theOutPut(){
    String theConvertedTotalSign = _isDollar? '\$' : '€';
    _outPut = '$_convertedTotal $theConvertedTotalSign';
    notifyListeners();
  }

  void incrementValue(String value){
    switch(value){
      case '1p':
        _onePaperPound += 1;
        _total += 1;
        _convertedTotal += _calculatedConversion(1);
        break;
      case '1m':
        _oneMetalPound += 1;
        _total += 1;
        _convertedTotal += _calculatedConversion(1);
        break;
      case '5':
        _fivePounds += 1;
        _total += 5;
        _convertedTotal += _calculatedConversion(5);
        break;
      case '10':
        _tenPounds += 1;
        _total += 10;
        _convertedTotal += _calculatedConversion(10);
        break;
      case '20':
        _twentyPounds += 1;
        _total += 20;
        _convertedTotal += _calculatedConversion(20);
        break;
      case '50':
        _fiftyPounds += 1;
        _total += 50;
        _convertedTotal += _calculatedConversion(50);
        break;
      case '100':
        _hundredPounds += 1;
        _total += 100;
        _convertedTotal += _calculatedConversion(100);
        break;
      case '200':
        _twoHundredPounds += 1;
        _total += 200;
        _convertedTotal += _calculatedConversion(200);
        break;
      default:
        _total += 0;
        break;
    }
    theOutPut();
    notifyListeners();
  }


  void decrementValue(String value){
    switch(value){
      case '1p':
        if(_onePaperPound > 0){
          _onePaperPound -= 1;
          _total -= 1;
          _convertedTotal -= _calculatedConversion(1);
        }
        break;
      case '1m':
            if(_oneMetalPound > 0){
          _oneMetalPound -= 1;
          _total -= 1;
          _convertedTotal -= _calculatedConversion(1);
            }
        break;
      case '5':
        if(_fivePounds > 0){
          _fivePounds -= 1;
          _total -= 5;
          _convertedTotal -= _calculatedConversion(5);
        }
        break;
      case '10':
        if(_tenPounds > 0){
          _tenPounds -= 1;
          _total -= 10;
          _convertedTotal -= _calculatedConversion(10);
        }
        break;
      case '20':
        if(_twentyPounds > 0){
          _twentyPounds -= 1;
          _total -= 20;
          _convertedTotal -= _calculatedConversion(20);
        }
        break;
      case '50':
        if(_fiftyPounds > 0){
          _fiftyPounds -= 1;
          _total -= 50;
          _convertedTotal -= _calculatedConversion(50);
        }
        break;
      case '100':
        if(_hundredPounds > 0){
          _hundredPounds -= 1;
          _total -= 100;
          _convertedTotal -= _calculatedConversion(100);
        }
        break;
      case '200':
        if(_twoHundredPounds > 0){
          _twoHundredPounds -= 1;
          _total -= 200;
          _convertedTotal -= _calculatedConversion(200);
        }
        break;
      default:
        _total -= 0;
        break;
    }
    theOutPut();
    notifyListeners();
  }
}