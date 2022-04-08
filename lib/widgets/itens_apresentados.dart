import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarefas/components/item.dart';
import 'package:tarefas/constantes.dart';

class ItensApresentador extends StatefulWidget {
  final String item;
  final DateTime data;
  final double altura, largura;
  final void Function(Item)? fun;
  final Item? itemPego;
  const ItensApresentador(
      {required this.item,
      required this.data,
      required this.altura,
      required this.largura,
      this.itemPego,
      this.fun,
      Key? key})
      : super(key: key);

  @override
  State<ItensApresentador> createState() => _ItensApresentadorState();
}

class _ItensApresentadorState extends State<ItensApresentador> {
  Color corBotoaConfirmar = Cores.corTextDialogo;
  Color corContainerItem = Cores.corItensParaFazer;
  IconData iconConfirmar = Icons.check_circle_outline;

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
                              fontSize: constraints.maxHeight * .2,
                              fontWeight: FontWeight.w500,
                              color: corContainerItem == Cores.corItensParaFazer
                                  ? Cores.corTextDialogo
                                  : Cores.corItensParaFazer,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              widget.item,
                              style: TextStyle(
                                fontSize: constraints.maxHeight * .4,
                                fontWeight: FontWeight.bold,
                                color:
                                    corContainerItem == Cores.corItensParaFazer
                                        ? Cores.corTextDialogo
                                        : Cores.corItensParaFazer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))),
            decoration: BoxDecoration(
              color: corContainerItem,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          IconButton(
            onPressed: () {
              widget.fun!(widget.itemPego!);
              setState(() {});
            },
            icon: Icon(
              Icons.cancel_outlined,
              color: Cores.corTextDialogo,
              size: widget.largura * .04,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                if (corBotoaConfirmar == Cores.corConfirmar) {
                  corBotoaConfirmar = Cores.corTextDialogo;
                  iconConfirmar = Icons.check_circle_outline;
                  corContainerItem = Cores.corItensParaFazer;
                } else {
                  corBotoaConfirmar = Cores.corConfirmar;
                  iconConfirmar = Icons.check_circle;
                  corContainerItem = Cores.corConfirmar;
                }
              });
            },
            icon: Icon(
              iconConfirmar,
              size: widget.largura * .04,
              color: corBotoaConfirmar,
            ),
          ),
        ],
      ),
    );
  }
}
