import 'package:flutter/material.dart';

import '../models/item.dart';
import '../services/data/app_database.dart';
import '../themes/constantes.dart';
import 'botao.dart';

class AlertaDialogo extends StatefulWidget {
  const AlertaDialogo({Key? key}) : super(key: key);

  @override
  State<AlertaDialogo> createState() => _AlertaDialogoState();
}

class _AlertaDialogoState extends State<AlertaDialogo> {
  TextEditingController itemPegoController = TextEditingController();
  String? erro;

  @override
  Widget build(BuildContext context) {
    final double alturaPega = TamanhoTela().alturaTela(context);
    final double larguraPega = TamanhoTela().alturaTela(context);

    return AlertDialog(
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
              controller: itemPegoController,
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
                )),
                errorText: erro,
              ),
            ),
            const Spacer(),
            const Text(
              "Os itens adicionados ficarão disponíveis na tela inicial do seu aplicativo",
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
                    String text = itemPegoController.text;
                    if (text.isEmpty) {
                      setState(() {
                        erro = "Digite uma tarefa ou clica em cancelar";
                      });
                      return;
                    }
                    salvandoItem(
                      Item(
                        nomeItem: text,
                        dataItem: DateTime.now(),
                        confirmacao: 0,
                      ),
                    );
                    setState(() {
                      erro = null;
                    });
                    itemPegoController.clear();
                    Navigator.pop(context);
                  },
                  cor: Cores.corConfirmar,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
