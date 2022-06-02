import 'package:flutter/material.dart';
import 'package:tarefas/components/itens_apresentados.dart';
import 'package:tarefas/services/data/app_database.dart';

import 'package:tarefas/themes/constantes.dart';

import '../components/card_dialogo.dart';
import '../models/item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController itemPegoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double altura = TamanhoTela().alturaTela(context);
    final double largura = TamanhoTela().alturaTela(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista de tarefas",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        height: altura,
        width: largura,
        child: Padding(
          padding: EdgeInsets.only(left: largura * .010),
          child: FutureBuilder<List<Item>>(
            future: buscandoListaItem(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<Item> listaItens = snapshot.data!;
                if (listaItens.isNotEmpty) {
                  return RefreshIndicator(
                    onRefresh: buscandoListaItem,
                    child: SingleChildScrollView(
                      child: Column(
                        children: listaItens
                            .map(
                              (itemPego) => ItensApresentado(
                                itemPego: itemPego,
                                item: itemPego.nomeItem,
                                data: itemPego.dataItem,
                                altura: altura,
                                largura: largura,
                                funRemove: () {
                                  setState(() {
                                    deletandoItem(itemPego);
                                  });
                                },
                                funatualizar: () {
                                  setState(() {
                                    atualizandoTarefa(itemPego);
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: altura,
                    width: largura,
                    child: const Center(
                      child: Text("Lista de tarefas vazia"),
                    ),
                  );
                }
              } else {
                return SizedBox(
                  height: altura,
                  width: largura,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        Text("Carregando tarefas"),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => caixaParaAddItem(
          context: context,
          alturaPega: altura,
          larguraPega: largura,
          itemPegoController: itemPegoController,
        ),
        child: const Icon(Icons.add),
        elevation: 10,
      ),
    );
  }
}
