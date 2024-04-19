import 'package:flutter/material.dart';

class MoneyBoxScreen extends StatelessWidget {
  const MoneyBoxScreen({super.key});
  @override
  Widget build(BuildContext context) {
    String preLink = './assets/images/';
    List<List<String>> moneyImages =
    [['${preLink}oneP.jpg', '1'],
      ['${preLink}oneM.jpg', '1'],
      ['${preLink}five.jpg', '5'],
      ['${preLink}ten.jpg', '10'],
      ['${preLink}twenty.jpg', '20'],
      ['${preLink}fifty.jpg', '50'],
      ['${preLink}hundred.jpg', '100'],
      ['${preLink}twoHundred.webp', '200']
    ];

    const dollarIcon = IconData(0x0024);
    return Scaffold(

    appBar: AppBar(
        title: const Text('The Money Box'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(dollarIcon))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('The number of the Total money in the box', style: const TextStyle(
            fontSize: 18,
            color: Colors.black26
          ),),
          const SizedBox(height: 25,),
          Text('The number of the Total money in the box', style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 30,),
          Row(
            children: [
              InkWell(
                child: SizedBox(
                  height: 30,
                  child: Image.asset(moneyImages[0][0]),
                )),
                InkWell(
                  child: SizedBox(
                    height: 30,
                    child: Image.asset(moneyImages[1][0]),
                  ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                  child: SizedBox(
                    height: 30,
                    child: Image.asset(moneyImages[2][0]),
                  )),
              InkWell(
                child: SizedBox(
                  height: 30,
                  child: Image.asset(moneyImages[3][0]),
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                  child: SizedBox(
                    height: 30,
                    child: Image.asset(moneyImages[4][0]),
                  )),
              InkWell(
                child: SizedBox(
                  height: 30,
                  child: Image.asset(moneyImages[5][0]),
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                  child: SizedBox(
                    height: 30,
                    child: Image.asset(moneyImages[6][0]),
                  )),
              InkWell(
                child: SizedBox(
                  height: 30,
                  child: Image.asset(moneyImages[7][0]),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
