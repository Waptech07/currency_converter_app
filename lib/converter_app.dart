import 'package:flutter/material.dart';

void main() {
  runApp(CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      home: CurrencyConverterScreen(),
    );
  }
}

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  // Define variables for user input and conversion rates
  double amount = 1.0;
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  double result = 0.85; // Default conversion rate from USD to EUR

  // Placeholder exchange rates (you should fetch real rates)
  Map<String, double> exchangeRates = {
    'USD': 1.0,
    'EUR': 0.85,
    'GBP': 0.73,
    // Add more currencies and their exchange rates here
  };

  void convert() {
    double? fromRate = exchangeRates[fromCurrency];
    double? toRate = exchangeRates[toCurrency];
    setState(() {
      result = (amount / fromRate!) * toRate!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  amount = double.tryParse(text) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: fromCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      fromCurrency = newValue!;
                    });
                  },
                  items: exchangeRates.keys.map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                ),
                Text('to'),
                DropdownButton<String>(
                  value: toCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      toCurrency = newValue!;
                    });
                  },
                  items: exchangeRates.keys.map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: convert,
              child: Text('Convert'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Result: $result $toCurrency',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
