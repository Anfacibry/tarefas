import 'package:flutter/material.dart';

import '../constantes.dart';

class Item {
  final String nomeItem;
  final DateTime dataItem;
  Color corBotoaConfirmar;
  Color corContainerItem;
  IconData iconConfirmar;

  Item({
    required this.nomeItem,
    required this.dataItem,
    this.corBotoaConfirmar = Cores.corTextDialogo,
    this.corContainerItem = Cores.corItensParaFazer,
    this.iconConfirmar = Icons.check_circle_outline,
  });

  Item.json(Map<String, dynamic> json)
      : nomeItem = json["nomeItem"],
        dataItem = DateTime.parse(json["dataItem"]),
        corBotoaConfirmar = json["corBotoaConfirmar"],
        corContainerItem = json["corContainerItem"],
        iconConfirmar = json["iconConfirmar"];

  Map<String, dynamic> toJson() {
    return {
      "nomeItem": nomeItem,
      "dataItem": dataItem.toIso8601String(),
      "corBotoaConfirmar": corBotoaConfirmar.toString(),
      "corContainerItem": corContainerItem.toString(),
      "iconConfirmar": iconConfirmar.toString(),
    };
  }
}
