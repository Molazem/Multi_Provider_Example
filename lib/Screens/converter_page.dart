import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Logic/converter_logic.dart';

class ConverterPage extends StatelessWidget {
  const ConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theConverterProvider = Provider.of<ConverterLogic>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Computer\' language'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'The decimal number',
                    hintText: 'Type The Decimal Number',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0,
                        )
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                      ),
                    ),
                  ),
                  controller: theConverterProvider.theDecimalNumberController,
                  keyboardType: TextInputType.number,
                  onChanged: (text){
                  theConverterProvider.input = text;
                  theConverterProvider.convert();
    },

                ),
              ),
              const SizedBox(height: 15,),
              const Text('Binary:', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),),
              const SizedBox(height: 25,),
              Text(theConverterProvider.binary),
              const SizedBox(height: 25,),
              const Text('Octal:', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),),
              const SizedBox(height: 25,),
              Text(theConverterProvider.octal),
              const SizedBox(height: 25,),
              const Text('HexDecimal:', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),),
              const SizedBox(height: 25,),
              Text(theConverterProvider.hexDecimal),
            ],
          ),
        ),
      )
    );
  }
}
