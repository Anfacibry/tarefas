class Item {
  final int? id;
  final String nomeItem;
  final DateTime dataItem;
  final int confirmacao;

  Item({
    this.id,
    required this.nomeItem,
    required this.dataItem,
    required this.confirmacao,
  });

  @override
  String toString() {
    return "Id: $id, nome: $nomeItem, data: $dataItem, confirmação: $confirmacao";
  }
}
