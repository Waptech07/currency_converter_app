// To parse this JSON data, do
//
//     final symbolModel = symbolModelFromJson(jsonString);

import 'dart:convert';

SymbolModel symbolModelFromJson(String str) =>
    SymbolModel.fromJson(json.decode(str));

// String symbolModelToJson(SymbolModel data) => json.encode(data.toJson());

class SymbolModel {
  List<Symbol>? symbols;

  SymbolModel({
    this.symbols,
  });

  factory SymbolModel.fromJson(Map<String, dynamic> json) => SymbolModel(
        symbols: Map.from(json["symbols"]!)
            .entries
            .map((e) => Symbol.fromJson(e.value as Map<String, dynamic>))
            .toList(),
      );

  // Map<String, dynamic> toJson() => {
  //     "symbols": Map.from(symbols!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  // };
}

class Symbol {
  String? description;
  String? code;

  Symbol({
    this.description,
    this.code,
  });

  factory Symbol.fromJson(Map<String, dynamic> json) => Symbol(
        description: json["description"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "code": code,
      };
}
