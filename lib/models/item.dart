class Item {
  final String nomeItem;
  final DateTime dataItem;
  final bool confirmacao;

  Item({
    required this.nomeItem,
    required this.dataItem,
    required this.confirmacao,
  });

  Item.json(Map<String, dynamic> json)
      : nomeItem = json["nomeItem"],
        dataItem = DateTime.parse(json["dataItem"]),
        confirmacao = json["confirmacao"];

  Map<String, dynamic> toJson() {
    return {
      "nomeItem": nomeItem,
      "dataItem": dataItem.toIso8601String(),
      "confirmacao": confirmacao,
    };
  }
}
