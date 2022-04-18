import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarefas/components/item.dart';
import 'package:tarefas/constantes.dart';

class ItensApresentador extends StatefulWidget {
  final String item;
  final DateTime data;
  final double altura, largura;
  final void Function(Item)? funRemove;
  final void Function(Item)? funAdd;
  final Item? itemPego;
  const ItensApresentador(
      {required this.item,
      required this.data,
      required this.altura,
      required this.largura,
      this.itemPego,
      this.funRemove,
      this.funAdd,
      Key? key})
      : super(key: key);

  @override
  State<ItensApresentador> createState() => _ItensApresentadorState();
}

class _ItensApresentadorState extends State<ItensApresentador> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.altura * .003,
        bottom: widget.altura * .003,
      ),
      child: Row(
        children: [
          Container(
            height: widget.altura * .08,
            width: widget.largura * .35,
            child: LayoutBuilder(
                builder: ((context, constraints) => Padding(
                      padding:
                          EdgeInsets.only(left: constraints.maxWidth * .02),
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
                              color: widget.itemPego!.corContainerItem ==
                                      Cores.corItensParaFazer
                                  ? Cores.corTextDialogo
                                  : Cores.corItensParaFazer,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              widget.item,
                              style: TextStyle(
                                fontSize: constraints.maxHeight * .33,
                                fontWeight: FontWeight.bold,
                                color: widget.itemPego!.corContainerItem ==
                                        Cores.corItensParaFazer
                                    ? Cores.corTextDialogo
                                    : Cores.corItensParaFazer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))),
            decoration: BoxDecoration(
              color: widget.itemPego!.corContainerItem,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          //Icone de com botão decancelar o item
          IconButton(
            onPressed: () {
              widget.funRemove!(widget.itemPego!);
            },
            icon: Icon(
              Icons.cancel_outlined,
              color: Cores.corTextDialogo,
              size: widget.largura * .04,
            ),
          ),
          //Icone de com botão de confirmar o item o item
          IconButton(
            onPressed: () {
              setState(() {
                if (widget.itemPego!.corBotoaConfirmar == Cores.corConfirmar) {
                  widget.itemPego!.corBotoaConfirmar = Cores.corTextDialogo;
                  widget.itemPego!.iconConfirmar = Icons.check_circle_outline;
                  widget.itemPego!.corContainerItem = Cores.corItensParaFazer;
                } else {
                  widget.itemPego!.corBotoaConfirmar = Cores.corConfirmar;
                  widget.itemPego!.iconConfirmar = Icons.check_circle;
                  widget.itemPego!.corContainerItem = Cores.corConfirmar;
                }
              });
            },
            icon: Icon(
              widget.itemPego!.iconConfirmar,
              size: widget.largura * .04,
              color: widget.itemPego!.corBotoaConfirmar,
            ),
          ),
        ],
      ),
    );
  }
}
