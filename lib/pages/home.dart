import 'package:flutter/material.dart';
import 'package:tarefas/constantes.dart';

import 'package:tarefas/widgets/itens_apresentados.dart';

import '../components/item.dart';
import '../data/lista_itens.dart';
import '../widgets/botao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController itemPegoController = TextEditingController();
  //List<Item> listaAddicionada = itens;

  //Metodo para apresentação do dialogo
  void caixaParaAddItem({
    required BuildContext context,
    required double alturaPega,
    required double larguraPega,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Cores.corDialogo,
              title: const Text(
                "Digite o seu item",
                textAlign: TextAlign.center,
              ),
              content: SizedBox(
                height: alturaPega * .4,
                width: larguraPega * .8,
                child: Column(
                  children: [
                    //Caixa de texto para ser adicionado os itens
                    TextField(
                      decoration: InputDecoration(
                          label: const Text("Item"),
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Cores.corBotaoCancelarECaixaTexto,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          ))),
                      controller: itemPegoController,
                    ),
                    const Spacer(),
                    const Text(
                      "Os itens adicionados ficarção disponíveis na tela inicial do seu aplicativo",
                      style: TextStyle(
                        color: Cores.corTextDialogo,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Botao(
                          titulo: "Cancelar",
                          fun: () {
                            Navigator.pop(context);
                          },
                          cor: Cores.corBotaoCancelarECaixaTexto,
                        ),
                        //Botão de adicionar item pego da caixa de texto
                        Botao(
                          titulo: "Adicionar",
                          fun: () {
                            setState(() {
                              String text = itemPegoController.text;
                              itens.add(Item(
                                  nomeItem: text, dataItem: DateTime.now()));
                              itemPegoController.clear();
                            });
                            Navigator.pop(context);
                          },
                          cor: Cores.corConfirmar,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }

  //Função callbak que remove um item
  void remover(List<Item> lista, Item item) {
    setState(() {
      lista.remove(item);
    });
  }

  void adicionando(List<Item> lista, Item item) {
    setState(() {
      lista.add(item);
    });
  }

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
          child: Column(
            children: [
              Column(
                children: itens
                    .map(
                      (e) => ItensApresentador(
                        itemPego: e,
                        funRemove: (e) => remover(itens, e),
                        funAdd: (e) => adicionando(itens, e),
                        item: e.nomeItem,
                        data: e.dataItem,
                        altura: altura,
                        largura: largura,
                      ),
                    )
                    .toList(),
              ),
              Column(
                children: itensConfirmados
                    .map(
                      (e) => ItensApresentador(
                        itemPego: e,
                        funRemove: (e) => remover(itensConfirmados, e),
                        funAdd: (e) => adicionando(itensConfirmados, e),
                        item: e.nomeItem,
                        data: e.dataItem,
                        altura: altura,
                        largura: largura,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => caixaParaAddItem(
          context: context,
          alturaPega: altura,
          larguraPega: largura,
        ),
        child: const Icon(Icons.add),
        elevation: 10,
      ),
    );
  }
}
