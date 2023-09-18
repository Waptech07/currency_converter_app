import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConverterUI extends StatefulWidget {
  const ConverterUI({super.key});

  @override
  State<ConverterUI> createState() => _ConverterUIState();
}

class _ConverterUIState extends State<ConverterUI> {
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

  void changeConversion() {
    targetCurrency = baseCurrency;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
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
                        baseCurrency = newValue!;
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
            ElevatedButton(
              onPressed: changeConversion,
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
