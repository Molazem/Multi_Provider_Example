import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Logic/calculator_logic.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> theButtonsValue = [
      'AC','(  )','%','÷',
      '7','8','9','x',
      '4','5','6','-',
      '1','2','3','+',
      '+/-','0','.','=',
    ];
    var theCalProvider = Provider.of<CalLogic>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Computer Never Lie'),
      ),
      body: SafeArea(
          child: Column(
                    children: [
                        Expanded(child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(theCalProvider.displayNumber, style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500
                            ) ),
                          ),
                        )),
                        Expanded(
                            flex: 6,
                            child: GridView.builder(
                                itemCount: theButtonsValue.length,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                            itemBuilder: (context, index){
                              return CalButton(value: theButtonsValue[index]);
                            }))
                    ],
                  )),
    );
  }
}


class CalButton extends StatelessWidget {
  final String value;
  const CalButton({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    var theInnerCalProvider = Provider.of<CalLogic>(context);
    return Padding(
        padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(onPressed: () => theInnerCalProvider.handleInput(value) ,child: Expanded(
        child: Text(value, style:  const  TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),),
      )),
    );
  }
}
