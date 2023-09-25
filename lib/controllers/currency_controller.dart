import 'dart:convert';
import 'package:currency_converter_app/models/symbol_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CurrencyController extends GetxController {
  var amount = 0;
  var from = '';
  var to = '';
  var result = 0.0;
  bool isLoading = false;
  SymbolModel? symbols;

  void Load() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isLoading = !isLoading;
      refresh();
    });
  }

  @override
  void onInit() {
    getAllSymbols();
    super.onInit();
  }

  Future<String> getAllSymbols() async {
    try {
      Load();
      var response =
          await http.get(Uri.parse("https://api.exchangerate.host/symbols"));
      if (json.decode(response.body)['success'] == true) {
        Load();
        var content = json.decode(response.body); //['symbols'];
        symbols = SymbolModel.fromJson(content);
        refresh();
        print(json.decode(response.body));
        return "Success";
      } else {
        Load();
        print(json.decode(response.body));
        return "Error";
      }
    } catch (e) {
      Load();
      print(e.toString());
      return "Something went wrong";
    }
  }

  Future<String> convertcurrency(String from, String to, double amount) async {
    try {
      Load();
      var response = await http.get(Uri.parse(
          'https://api.exchangerate.host/convert?from=$from&to=$to&amount=$amount'));

      if (json.decode(response.body)['success'] == true) {
        Load();
        amount = json.decode(response.body)['result'];
        result = amount;
        print(result);
        refresh();
        return 'success';
      } else {
        Load();
        print(json.decode(response.body));
        return "Error";
      }
    } catch (e) {
      print(e.toString());
      return "something went wrong";
    }
  }
}
