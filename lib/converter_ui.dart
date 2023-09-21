import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConverterUI extends StatefulWidget {
  const ConverterUI({super.key});

  @override
  State<ConverterUI> createState() => _ConverterUIState();
}

class _ConverterUIState extends State<ConverterUI> {
  int result = 100;
  String baseCurrency = "USD";
  String targetCurrency = "GBP";
  List<String> baseCurrencies = [
    "USD", // US Dollar
    "EUR", // Euro
    "GBP", // Pound Sterling
    "NGN", // Nigerian Naira
    "INR", // Indian Rupee
    "AUD", // Australian Dollar
    "AED", // UAE Dirham
    "BRL", // Brazilian Real
    "CAD", // Canadian Dollar
    "CHF", // Swiss Franc
    "CNY", // Chinese Renminbi
    "JPY", // Japanese Yen
    "KRW", // South Korean Won
    "LKR", // Sri Lankan Rupee
    "MXN", // Mexican Peso
    "NZD", // New Zealand Dollar
    "QAR", // Qatari Riyal
    "SAR", // Saudi Riyal
    "SGD", // Singapore Dollar
    "ZAR", // South African Rand
  ];

  void convertCurrency() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assetName')),
          // gradient: LinearGradient(
          //   // Where the linear gradient begins and ends
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [
          //     Colors.white,
          //     Colors.purple,
          //     Colors.green,
          //     Colors.blue,
          //   ],
          // ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<String>(
                    value: baseCurrency,
                    items: baseCurrencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        baseCurrency = newValue!;
                      });
                    },
                  ),
                  Icon(CupertinoIcons.arrow_right_arrow_left),
                  DropdownButton<String>(
                    value: targetCurrency,
                    items: <String>['USD', 'EUR', 'GBP'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        targetCurrency = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: TextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter an Amount in $baseCurrency",
                    labelStyle: TextStyle(fontWeight: FontWeight.w500),
                    hintText: "e.g 1.0$baseCurrency"),
              ),
            ),
            Icon(
              CupertinoIcons.arrow_down,
              size: 30,
            ),
            ResultBox(result: result, targetCurrency: targetCurrency),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text(
                "Convert",
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 50), foregroundColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class ResultBox extends StatelessWidget {
  const ResultBox({
    super.key,
    required this.result,
    required this.targetCurrency,
  });

  final int result;
  final String targetCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Container(
        height: 50,
        width: 370,
        child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.indigo[400],
                borderRadius: BorderRadius.circular(5.0)),
            child: Padding(
                padding: EdgeInsets.only(top: 15.0, left: 20.0),
                child: Text(
                  "You get $result$targetCurrency",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.0,
                      color: Colors.black),
                ))),
      ),
    );
  }
}
