import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CurrencyController extends GetxController {
  var amount = 0;
  var from = '';
  var to = '';
  bool isLoading = false;

  void Load() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isLoading = !isLoading;
      refresh();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllSymbols();
    super.onInit();
  }

  void increaseAmount() {
    amount++;
    refresh();
  }

  Future<String> getAllSymbols() async {
    try {
      Load();
      var response =
          await http.get(Uri.parse("https://api.exchangerate.host/symbols"));
      if (json.decode(response.body)['success'] == true) {
        Load();
        print(json.decode(response.body));
        return " Success ";
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
}
