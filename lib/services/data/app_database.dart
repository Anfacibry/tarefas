import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/item.dart';

const String tarefa = "tarefa";

Future<Database> criandoDataBase() async {
  Future<Database> database = openDatabase(
    join(await getDatabasesPath(), "tarefas.db"),
    onCreate: (db, version) {
      return db.execute("""CREATE TABLE $tarefa(
        id INTEGER PRIMARY KEY,
        confirmacao INTEGER,
        nome_item TEXT,
        data_item TEXT)""");
    },
    version: 1,
  );
  return database;
}

Future<int> salvandoItem(Item item) async {
  Database db = await criandoDataBase();
  final Map<String, dynamic> listaPega = {};
  listaPega["nome_item"] = item.nomeItem;
  listaPega["data_item"] = item.dataItem.toIso8601String();
  listaPega["confirmacao"] = item.confirmacao;
  return db.insert(
    tarefa,
    listaPega,
  );
}

Future<List<Item>> buscandoListaItem() async {
  final Database db = await criandoDataBase();
  final List<Map<String, dynamic>> lista = await db.query(tarefa);
  final List<Item> listaConcluida = [];
  for (var item in lista) {
    final Item itemPego = Item(
      id: item["id"],
      nomeItem: item["nome_item"],
      dataItem: DateTime.parse(item["data_item"]),
      confirmacao: item["confirmacao"],
    );
    listaConcluida.add(itemPego);
    listaConcluida.sort((a, b) {
      if (a.confirmacao == 0 && b.confirmacao == 1) {
        return -1;
      } else if (a.confirmacao == 1 && b.confirmacao == 0) {
        return 1;
      } else {
        return 0;
      }
    });
  }
  return listaConcluida;
}

Future<void> deletandoDb() async {
  final Database db = await criandoDataBase();
  await db.delete(tarefa);
}

Future<int> deletandoItem(Item item) async {
  final Database db = await criandoDataBase();
  return db.delete(
    tarefa,
    where: "id = ?",
    whereArgs: [item.id],
  );
}

Future<int> atualizandoTarefa(Item item) async {
  final Database db = await criandoDataBase();
  final Map<String, dynamic> listaAtualizar = {};
  if (item.confirmacao == 0) {
    listaAtualizar["item"] = {
      "id": item.id,
      "nome_item": item.nomeItem,
      "data_item": item.dataItem.toIso8601String(),
      "confirmacao": 1,
    };
  } else {
    listaAtualizar["item"] = {
      "id": item.id,
      "nome_item": item.nomeItem,
      "data_item": item.dataItem.toIso8601String(),
      "confirmacao": 0,
    };
  }
  return db.update(
    tarefa,
    listaAtualizar["item"],
    where: "id = ?",
    whereArgs: [item.id],
  );
}
