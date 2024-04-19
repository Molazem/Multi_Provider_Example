import 'package:flutter/material.dart';
import 'package:untitled6/Screens/cal_page.dart';
import 'package:untitled6/Screens/moneybox_page.dart';

import 'converter_page.dart';

class TheMainPage extends StatelessWidget {
  const TheMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pointed\'s Cal'),
      ),
      body: const Center(
        child: Text('Welcome to the Pointed\'s Cal', style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
        ),),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const Text('Options', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),),
              const Divider(),
              ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CalculatorPage())), child: const Text('Arithmetic Calculator')),
              const SizedBox(height: 15,),
              ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ConverterPage())), child: const Text('Digital Converter')),
              const SizedBox(height: 15,),
              ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MoneyBoxScreen())), child: const Text('My MoneyBox')),
            ],
          ),
        ),
      ),
    );
  }
}
