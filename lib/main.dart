import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/Logic/calculator_logic.dart';
import 'package:untitled6/Logic/converter_logic.dart';
import 'package:untitled6/Screens/main_page.dart';

import 'Logic/moneybox_logic.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<CalLogic>(create: (context) => CalLogic()),
          ChangeNotifierProvider<ConverterLogic>(create: (context) => ConverterLogic()),
          ChangeNotifierProvider<MoneyBoxLogic>(create: (context) => MoneyBoxLogic()),
      ],
        child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Cal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true
      ),
      home: const TheMainPage(),
    );
  }
}

