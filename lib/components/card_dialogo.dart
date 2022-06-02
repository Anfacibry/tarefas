import 'package:flutter/material.dart';

import '../models/item.dart';
import '../services/data/app_database.dart';
import '../themes/constantes.dart';
import 'botao.dart';

void caixaParaAddItem({
  required BuildContext context,
  required double alturaPega,
  required double larguraPega,
  required TextEditingController itemPegoController,
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
                          String text = itemPegoController.text;
                          salvandoItem(
                            Item(
                              nomeItem: text,
                              dataItem: DateTime.now(),
                              confirmacao: 0,
                            ),
                          );
                          //deletandoDb();

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
          ));
}
