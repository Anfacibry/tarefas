import 'package:flutter/material.dart';

class Botao extends StatefulWidget {
  final String titulo;
  final void Function() fun;
  final Color cor;
  const Botao(
      {required this.titulo, required this.fun, required this.cor, Key? key})
      : super(key: key);

  @override
  State<Botao> createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.fun,
      child: Text(
        widget.titulo,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
      style: ElevatedButton.styleFrom(
          primary: widget.cor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
