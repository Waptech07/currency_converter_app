import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:currency_converter_app/controllers/currency_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CurrencyController _currencyController;
  late final TextEditingController _amountController;

  String? _symbol;
  String? _selectedFrom;

  List<String> symbols = [
    'USD', // United States Dollar
    'EUR', // Euro
    'GBP', // Pound Sterling
  ];

  @override
  void initState() {
    _currencyController = Get.put(CurrencyController());
    _amountController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GetBuilder<CurrencyController>(
          init: _currencyController,
          builder: (controller) {
            return FloatingActionButton(
              onPressed: () {
                controller.convertcurrency(_selectedFrom.toString(),
                    _symbol.toString(), double.parse(_amountController.text));
              },
              child: controller.isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                  : Icon(CupertinoIcons.arrow_right_arrow_left),
            );
          }),
      appBar: AppBar(
        title: Text('Currency Converter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.blue),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: GetBuilder<CurrencyController>(
                      init: _currencyController,
                      builder: (controller) {
                        return DropdownButton(
                            dropdownColor: Colors.white70,
                            borderRadius: BorderRadius.circular(20.0),
                            isExpanded: true,
                            value: _selectedFrom,
                            hint: Text('From'),
                            items: controller.symbols?.symbols?.map((entry) {
                                  String val = entry.code ?? "";
                                  return DropdownMenuItem(
                                      value: val,
                                      child:
                                          Text('$val  ${entry.description}'));
                                }).toList() ??
                                [],
                            onChanged: (value) {
                              if (value == null) return;
                              setState(() {
                                _selectedFrom = value.toString();
                              });
                            });
                      }),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: Colors.indigo,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(
                        CupertinoIcons.arrow_down_circle,
                        size: 30.0,
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.indigo,
                    ))
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: double.infinity,
                  child: DropdownButton(
                      dropdownColor: Colors.white70,
                      borderRadius: BorderRadius.circular(20.0),
                      isExpanded: true,
                      value: _symbol,
                      hint: Text('To'),
                      items: symbols.map((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _symbol = value ?? '';
                        });
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                      hintText: "e.g 10.0${_selectedFrom ?? " "}",
                      labelText: "Enter Amount",
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.indigo,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.indigo,
                      ))),
                ),
                Spacer(),
                ConvertedAmount(currencyController: _currencyController)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ConvertedAmount extends StatelessWidget {
  const ConvertedAmount({
    super.key,
    required CurrencyController currencyController,
  }) : _currencyController = currencyController;

  final CurrencyController _currencyController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: GetBuilder<CurrencyController>(
            init: _currencyController,
            builder: (controller) {
              return Text(
                'Result: ${controller.result}',
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              );
            }),
      ),
    );
  }
}
