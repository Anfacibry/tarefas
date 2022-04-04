import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarefas/constantes.dart';

class ItensApresentador extends StatelessWidget {
  final String item;
  final DateTime data;
  final double altura, largura;
  const ItensApresentador(
      {required this.item,
      required this.data,
      required this.altura,
      required this.largura,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: altura * .003,
        bottom: altura * .003,
      ),
      child: Container(
        height: altura * .1,
        width: largura * .8,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(DateFormat("dd/MM/yyyy - HH:mm").format(data).toString()),
              Text(
                item,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        decoration: const BoxDecoration(
          color: Cores.corItensParaFazer,
        ),
      ),
    );
  }
}
