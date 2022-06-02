import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarefas/models/item.dart';
import 'package:tarefas/themes/constantes.dart';

class ItensApresentado extends StatefulWidget {
  final String item;
  final DateTime data;
  final double? altura, largura;
  final void Function() funRemove;
  final void Function() funatualizar;
  final Item? itemPego;
  const ItensApresentado(
      {required this.item,
      required this.data,
      this.altura,
      this.largura,
      this.itemPego,
      required this.funRemove,
      required this.funatualizar,
      Key? key})
      : super(key: key);

  @override
  State<ItensApresentado> createState() => _ItensApresentadorState();
}

class _ItensApresentadorState extends State<ItensApresentado> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.altura! * .003,
        bottom: widget.altura! * .003,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: widget.altura! * .08,
              width: widget.largura! * .35,
              decoration: BoxDecoration(
                color: widget.itemPego!.confirmacao == 1
                    ? Cores.corConfirmar
                    : Cores.corItensParaFazer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: LayoutBuilder(
                  builder: ((context, constraints) => Padding(
                        padding: EdgeInsets.only(
                          left: constraints.maxWidth * .02,
                          right: constraints.maxWidth * .02,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              DateFormat("dd/MM/yyyy - HH:mm")
                                  .format(widget.data)
                                  .toString(),
                              style: TextStyle(
                                fontSize: constraints.maxHeight * .18,
                                fontWeight: FontWeight.w500,
                                color: widget.itemPego!.confirmacao == 1
                                    ? Cores.corItensParaFazer
                                    : Cores.corTextDialogo,
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                widget.item,
                                style: TextStyle(
                                  fontSize: constraints.maxHeight * .33,
                                  fontWeight: FontWeight.bold,
                                  color: widget.itemPego!.confirmacao == 1
                                      ? Cores.corItensParaFazer
                                      : Cores.corTextDialogo,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))),
            ),
          ),
          //Icone de com botão decancelar o item
          IconButton(
            onPressed: widget.funRemove,
            icon: Icon(
              Icons.cancel_outlined,
              color: Cores.corTextDialogo,
              size: widget.largura! * .04,
            ),
          ),
          //Icone de com botão de confirmar o item o item
          IconButton(
            onPressed: widget.funatualizar,
            icon: Icon(
              widget.itemPego!.confirmacao == 1
                  ? Icons.check_circle
                  : Icons.check_circle_outline,
              size: widget.largura! * .04,
              color: widget.itemPego!.confirmacao == 1
                  ? Cores.corConfirmar
                  : Cores.corTextDialogo,
            ),
          ),
        ],
      ),
    );
  }
}
