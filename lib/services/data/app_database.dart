import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> criandoDataBase() async {
  Future<Database> database = openDatabase(
    join(await getDatabasesPath(), "tarefas.db"),
    onCreate: (db, version) {
      db.execute("""CREATE TABLE tarefa(
        id INTEGER PRIMARY KEY,
        nome_pessoa TEXT,
        numero_pessoa TEXT)""");
    },
    version: 1,
  );
  return database;
}
