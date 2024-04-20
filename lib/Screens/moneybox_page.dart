import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Logic/moneybox_logic.dart';

class MoneyBoxScreen extends StatelessWidget {
  const MoneyBoxScreen({super.key});
  @override
  Widget build(BuildContext context) {
    String preLink = './assets/images/';
    List<List<String>> moneyImages =
    [['${preLink}oneP.jpg', '1p'],
      ['${preLink}oneM.jpg', '1m'],
      ['${preLink}five.jpg', '5'],
      ['${preLink}ten.jpg', '10'],
      ['${preLink}twenty.jpg', '20'],
      ['${preLink}fifty.jpg', '50'],
      ['${preLink}hundred.jpg', '100'],
      ['${preLink}twoHundred.webp', '200']
    ];

    const dollarIcon = IconData(0x0024);
    double height = 80;
    var myProvider = Provider.of<MoneyBoxLogic>(context);
    return Scaffold(

    appBar: AppBar(
        title: const Text('The Money Box'),
        actions: [
          IconButton(onPressed: () => myProvider.dollarOrEuro(), icon:  Icon( myProvider.isDollar ? dollarIcon : Icons.euro))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text('${myProvider.total.toString()} E£', style: const TextStyle(
            fontSize: 22,
            color: Colors.black54
          ),),
          const SizedBox(height: 25,),
           Text(myProvider.outPut, style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
                children:[Row(
              children: [
                SizedBox(
                  height: height,
                  child: Image.asset(moneyImages[0][0]),
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 5),
                  child: Text(myProvider.onePaperPoundAmount.toString(), style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                  Column(
                    children: [
                      IconButton(onPressed: () => myProvider.incrementValue(moneyImages[0][1]), icon: const Icon(Icons.add)),
                      IconButton(onPressed: () => myProvider.decrementValue(moneyImages[0][1]), icon: const Icon(Icons.remove)),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    child: Image.asset(moneyImages[1][0]),
                  ),
                 Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 5),
                  child: Text(myProvider.oneMetalPoundAmount.toString(), style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Column(
                  children: [
                    IconButton(onPressed: () => myProvider.incrementValue(moneyImages[1][1]), icon: const Icon(Icons.add)),
                    IconButton(onPressed: () => myProvider.decrementValue(moneyImages[1][1]), icon: const Icon(Icons.remove)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                SizedBox(
                  height: height,
                  child: Image.asset(moneyImages[2][0]),
                ), Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 5),
                  child: Text(myProvider.fivePoundsAmount.toString(), style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Column(
                  children: [
                    IconButton(onPressed: () => myProvider.incrementValue(moneyImages[2][1]), icon: const Icon(Icons.add)),
                    IconButton(onPressed: () => myProvider.decrementValue(moneyImages[2][1]), icon: const Icon(Icons.remove)),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: height,
                  child: Image.asset(moneyImages[3][0]),
                ), Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 5),
                  child: Text(myProvider.tenPoundsAmount.toString(), style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Column(
                  children: [
                    IconButton(onPressed: () => myProvider.incrementValue(moneyImages[3][1]), icon: const Icon(Icons.add)),
                    IconButton(onPressed: () => myProvider.decrementValue(moneyImages[3][1]), icon: const Icon(Icons.remove)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                SizedBox(
                  height: height,
                  child: Image.asset(moneyImages[4][0]),
                ), Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 5),
                  child: Text(myProvider.twentyPoundsAmount.toString(), style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Column(
                  children: [
                    IconButton(onPressed: () => myProvider.incrementValue(moneyImages[4][1]), icon: const Icon(Icons.add)),
                    IconButton(onPressed: () => myProvider.decrementValue(moneyImages[4][1]), icon: const Icon(Icons.remove)),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: height,
                  child: Image.asset(moneyImages[5][0]),
                ), Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 5),
                  child: Text(myProvider.fiftyPoundsAmount.toString(), style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Column(
                  children: [
                    IconButton(onPressed: () => myProvider.incrementValue(moneyImages[5][1]), icon: const Icon(Icons.add)),
                    IconButton(onPressed: () => myProvider.decrementValue(moneyImages[5][1]), icon: const Icon(Icons.remove)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                SizedBox(
                  height: height,
                  child: Image.asset(moneyImages[6][0]),
                ), Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 5),
                  child: Text(myProvider.hundredPoundsAmount.toString(), style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Column(
                  children: [
                    IconButton(onPressed: () => myProvider.incrementValue(moneyImages[6][1]), icon: const Icon(Icons.add)),
                    IconButton(onPressed: () => myProvider.decrementValue(moneyImages[6][1]), icon: const Icon(Icons.remove)),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: height,
                  child: Image.asset(moneyImages[7][0]),
                ), Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 5),
                  child: Text(myProvider.twoHundredPoundsAmount.toString(), style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Column(
                  children: [
                    IconButton(onPressed: () => myProvider.incrementValue(moneyImages[7][1]), icon: const Icon(Icons.add)),
                    IconButton(onPressed: () => myProvider.decrementValue(moneyImages[7][1]), icon: const Icon(Icons.remove)),
                  ],
                ),
              ],
            )]),
          )
        ],
      ),
    );
  }
}
