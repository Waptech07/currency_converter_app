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
    "LKR", // Sri Lankan Rupee
    "AUD", // Australian Dollar
    "BRL", // Brazilian Real
    ""
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            children: [],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter an Amount in $baseCurrency",
                  hintText: "e.g 1.0$baseCurrency"),
            ),
          )
        ],
      ),
    );
  }
}
