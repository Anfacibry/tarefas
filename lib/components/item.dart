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
}
